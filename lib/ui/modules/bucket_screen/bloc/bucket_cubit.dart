import 'package:equatable/equatable.dart';
import 'package:repositories/models.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

abstract class BucketEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBucket extends BucketEvent {}

class UpdateTitle extends BucketEvent {
  final String title;
  UpdateTitle(this.title);

  @override
  List<Object?> get props => [title];
}

class UpdateDescription extends BucketEvent {
  final String description;
  UpdateDescription(this.description);

  @override
  List<Object?> get props => [description];
}

class UpdateAttributes extends BucketEvent {
  final List<Attribute> attributes;
  UpdateAttributes(this.attributes);

  @override
  List<Object?> get props => [attributes];
}

abstract class BucketState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BucketLoading extends BucketState {}

class BucketLoaded extends BucketState {
  final Bucket bucket;
  BucketLoaded(this.bucket);

  @override
  List<Object?> get props => [bucket];
}

class BucketNotFound extends BucketState {
  @override
  List<Object?> get props => ['Bucket not found'];
}

class BucketError extends BucketState {
  final String error;
  BucketError(this.error);

  @override
  List<Object?> get props => [error];
}

class BucketBloc extends Bloc<BucketEvent, BucketState> {
  final String bucketId;
  final BucketRepository bucketRepo;
  StreamSubscription<List<Bucket>>? _bucketSubscription;
  Bucket? _cachedBucket;

  BucketBloc(this.bucketId, this.bucketRepo) : super(BucketLoading()) {
    on<LoadBucket>(_onLoadBucket);
    on<UpdateTitle>(_onUpdateTitle);
    on<UpdateDescription>(_onUpdateDescription);
    on<UpdateAttributes>(_onUpdateAttributes);

    _setupSubscription();
  }

  void _setupSubscription() {
    try {
      _bucketSubscription = bucketRepo.dataStream.listen((buckets) {
        final currentBucket = buckets.firstWhere(
          (b) => b.bucketId == bucketId,
          orElse: () => _cachedBucket!,
        );

        if (currentBucket != _cachedBucket) {
          _cachedBucket = currentBucket;
          add(LoadBucket());
        }
      }, onError: (error) => addError(error.toString()));
    } catch (e) {
      // Repository might not support streaming, fallback to one-time load
    }
  }

  // This method is responsible for:
  //
  // Emits [BucketLoading] while loading.
  // If `bucketId` is empty, fetches buckets by org ID:
  //   - Emits [BucketNotFound] if none found.
  //   - Otherwise, caches and emits the first bucket as [BucketLoaded].
  // If `bucketId` is not empty, fetches bucket by ID:
  //   - Emits [BucketLoaded] if found, or [BucketNotFound] if not.
  // Emits [BucketError] on failure.
  Future<void> _onLoadBucket(LoadBucket event, Emitter<BucketState> emit) async {
    emit(BucketLoading());
    if (bucketId.trim().isEmpty) {
      var buckets = await bucketRepo.getBucketsByOrgId(orgRepo.orgId!);
      if (buckets.isEmpty) {
        emit(BucketNotFound());
      } else {
        _cachedBucket = buckets.first;
        emit(BucketLoaded(_cachedBucket!));
      }
      return;
    }
    try {
      final bucket = await bucketRepo.getBucketById(bucketId);
      if (bucket != null) {
        _cachedBucket = bucket;
        emit(BucketLoaded(bucket));
      } else {
        emit(BucketNotFound());
      }
    } catch (e) {
      emit(BucketError(e.toString()));
    }
  }

  Future<void> _onUpdateTitle(UpdateTitle event, Emitter<BucketState> emit) async {
    if (_cachedBucket == null) return;

    try {
      await bucketRepo.updateTitle(bucketId, event.title);
      if (_bucketSubscription == null) {
        _cachedBucket = _cachedBucket!.copyWith(title: event.title);
        emit(BucketLoaded(_cachedBucket!));
      }
    } catch (e) {
      emit(BucketError('Failed to update title: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateDescription(
    UpdateDescription event,
    Emitter<BucketState> emit,
  ) async {
    if (_cachedBucket == null) return;

    try {
      await bucketRepo.updateDescription(bucketId, event.description);
      if (_bucketSubscription == null) {
        _cachedBucket = _cachedBucket!.copyWith(description: event.description);
        emit(BucketLoaded(_cachedBucket!));
      }
    } catch (e) {
      emit(BucketError('Failed to update description: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateAttributes(
    UpdateAttributes event,
    Emitter<BucketState> emit,
  ) async {
    if (_cachedBucket == null) return;

    try {
      await bucketRepo.updateAttributes(bucketId, event.attributes);
      if (_bucketSubscription == null) {
        _cachedBucket = _cachedBucket!.copyWith(attributes: event.attributes);
        emit(BucketLoaded(_cachedBucket!));
      }
    } catch (e) {
      emit(BucketError('Failed to update attributes: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    _bucketSubscription?.cancel();
    return super.close();
  }
}
