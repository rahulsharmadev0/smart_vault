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
  final List<Bucket> buckets;
  final int currentSelectedIndex;

  Bucket get bucket => buckets[currentSelectedIndex];
  BucketLoaded(this.buckets, this.currentSelectedIndex);

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
  final OrganizationRepository orgRepo;
  StreamSubscription<List<Bucket>>? bucketSubscription;
  List<Bucket> _cachedBuckets = [];
  int _currentIndex = 0;

  BucketBloc(this.bucketId, this.bucketRepo, this.orgRepo) : super(BucketLoading()) {
    on<LoadBucket>(_onLoadBucket);
    on<UpdateTitle>(_onUpdateTitle);
    on<UpdateDescription>(_onUpdateDescription);
    on<UpdateAttributes>(_onUpdateAttributes);

    _setupSubscription();
  }

  void _setupSubscription() {
    try {
      bucketSubscription = bucketRepo.dataStream.listen((buckets) {
        _cachedBuckets = buckets;
        _currentIndex = buckets.indexWhere((b) => b.bucketId == bucketId);
        if (_currentIndex >= 0) {
          add(LoadBucket());
        }
      }, onError: (error) => addError(error.toString()));
    } catch (e) {
      // Repository might not support streaming, fallback to one-time load
    }
  }

  Future<void> _onLoadBucket(LoadBucket event, Emitter<BucketState> emit) async {
    emit(BucketLoading());

    try {
      if (bucketId.trim().isEmpty) {
        var buckets = await bucketRepo.getBucketsByOrgId(orgRepo.orgId!);
        if (buckets.isEmpty) {
          emit(BucketNotFound());
        } else {
          _cachedBuckets = buckets;
          _currentIndex = 0;
          emit(BucketLoaded(buckets, 0));
        }
        return;
      }

      final bucket = await bucketRepo.getBucketById(bucketId);
      if (bucket != null) {
        _cachedBuckets = [bucket];
        _currentIndex = 0;
        emit(BucketLoaded(_cachedBuckets, _currentIndex));
      } else {
        emit(BucketNotFound());
      }
    } catch (e) {
      emit(BucketError(e.toString()));
    }
  }

  Future<void> _onUpdateTitle(UpdateTitle event, Emitter<BucketState> emit) async {
    if (_cachedBuckets.isEmpty || _currentIndex < 0) return;

    try {
      await bucketRepo.updateTitle(bucketId, event.title);
      if (bucketSubscription == null) {
        var updatedBucket = _cachedBuckets[_currentIndex].copyWith(title: event.title);
        _cachedBuckets[_currentIndex] = updatedBucket;
        emit(BucketLoaded(_cachedBuckets, _currentIndex));
      }
    } catch (e) {
      emit(BucketError('Failed to update title: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateDescription(
    UpdateDescription event,
    Emitter<BucketState> emit,
  ) async {
    if (_cachedBuckets.isEmpty || _currentIndex < 0) return;

    try {
      await bucketRepo.updateDescription(bucketId, event.description);
      if (bucketSubscription == null) {
        var updatedBucket = _cachedBuckets[_currentIndex].copyWith(
          description: event.description,
        );
        _cachedBuckets[_currentIndex] = updatedBucket;
        emit(BucketLoaded(_cachedBuckets, _currentIndex));
      }
    } catch (e) {
      emit(BucketError('Failed to update description: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateAttributes(
    UpdateAttributes event,
    Emitter<BucketState> emit,
  ) async {
    if (_cachedBuckets.isEmpty || _currentIndex < 0) return;

    try {
      await bucketRepo.updateAttributes(bucketId, event.attributes);
      if (bucketSubscription == null) {
        var updatedBucket = _cachedBuckets[_currentIndex].copyWith(
          attributes: event.attributes,
        );
        _cachedBuckets[_currentIndex] = updatedBucket;
        emit(BucketLoaded(_cachedBuckets, _currentIndex));
      }
    } catch (e) {
      emit(BucketError('Failed to update attributes: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    bucketSubscription?.cancel();
    return super.close();
  }
}
