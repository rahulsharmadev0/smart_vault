import 'package:equatable/equatable.dart';
import 'package:repositories/models.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

abstract class BucketState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BucketLoading extends BucketState {
  @override
  List<Object?> get props => [];
}

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
  late StreamSubscription<List<Bucket>> _bucketSubscription;

  BucketCubit(this.bucketId) : super(BucketLoading()) {
    _bucketSubscription = bucketRepo.dataStream.listen(
      (buckets) => onLoadBuckets(),
      onError: (error) => addError(error),
    );
  }

  void onLoadBuckets() async {
    emit(BucketLoading());
    try {
      final bucket = await bucketRepo.getBucketById(bucketId);
      if (bucket != null) {
        emit(BucketLoaded(bucket));
      } else {
        emit(BucketNotFound());
      }
    } catch (e) {
      emit(BucketError(e.toString()));
    }
  }

  void updateTitle(String title) async {
    await bucketRepo.updateTitle(bucketId, title);
  }

  void updateDescription(String description) async {
    await bucketRepo.updateDescription(bucketId, description);
  }

  void updateAttributes(List<Attribute> attributes) async {
    await bucketRepo.updateAttributes(bucketId, attributes);
  }

  @override
  Future<void> close() {
    _bucketSubscription.cancel();
    return super.close();
  }
}
