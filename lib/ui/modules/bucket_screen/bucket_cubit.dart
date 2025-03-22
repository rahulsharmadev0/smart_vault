import 'package:equatable/equatable.dart';
import 'package:repositories/models.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

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

class BucketNotFound extends BucketState {}

class BucketError extends BucketState {
  final String error;
  BucketError(this.error);

  @override
  List<Object?> get props => [error];
}

/// Use bucketRepo
class BucketCubit extends Cubit<BucketState> {
  final String bucketId;
  StreamSubscription<List<Bucket>>? _bucketSubscription;
  Bucket? _cachedBucket;

  BucketCubit(this.bucketId) : super(BucketLoading()) {
    // Subscribe to bucket changes if the repository provides a stream
    _setupSubscription();
  }

  void _setupSubscription() {
    try {
      _bucketSubscription = bucketRepo.dataStream.listen((buckets) {
        // If we already have a loaded state, update it if our bucket changed
        if (state is BucketLoaded) {
          final currentBucket = buckets.firstWhere(
            (b) => b.bucketId == bucketId,
            orElse: () => _cachedBucket!,
          );

          if (currentBucket != _cachedBucket) {
            _cachedBucket = currentBucket;
            emit(BucketLoaded(currentBucket));
          }
        } else {
          // Otherwise load fresh
          onLoadBuckets();
        }
      }, onError: (error) => emit(BucketError(error.toString())));
    } catch (e) {
      // Repository might not support streaming, fallback to one-time load
    }
  }

  void onLoadBuckets() async {
    emit(BucketLoading());
    if (bucketId.trim().isEmpty) {
      emit(BucketNotFound());
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

  void updateTitle(String title) async {
    if (_cachedBucket == null) return;

    try {
      await bucketRepo.updateTitle(bucketId, title);
      // If no stream is available, manually update state
      if (_bucketSubscription == null) {
        _cachedBucket = _cachedBucket!.copyWith(title: title);
        emit(BucketLoaded(_cachedBucket!));
      }
    } catch (e) {
      emit(BucketError('Failed to update title: ${e.toString()}'));
    }
  }

  void updateDescription(String description) async {
    if (_cachedBucket == null) return;

    try {
      await bucketRepo.updateDescription(bucketId, description);
      // If no stream is available, manually update state
      if (_bucketSubscription == null) {
        _cachedBucket = _cachedBucket!.copyWith(description: description);
        emit(BucketLoaded(_cachedBucket!));
      }
    } catch (e) {
      emit(BucketError('Failed to update description: ${e.toString()}'));
    }
  }

  void updateAttributes(List<Attribute> attributes) async {
    if (_cachedBucket == null) return;

    try {
      await bucketRepo.updateAttributes(bucketId, attributes);
      // If no stream is available, manually update state
      if (_bucketSubscription == null) {
        _cachedBucket = _cachedBucket!.copyWith(attributes: attributes);
        emit(BucketLoaded(_cachedBucket!));
      }
    } catch (e) {
      emit(BucketError('Failed to update attributes: ${e.toString()}'));
    }
  }

  // Refresh bucket data manually
  void refresh() {
    onLoadBuckets();
  }

  @override
  Future<void> close() {
    _bucketSubscription?.cancel();
    return super.close();
  }
}
