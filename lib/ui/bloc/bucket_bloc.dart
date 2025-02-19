import 'package:edukit/ui/bloc/_messages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/models.dart';
import 'package:repositories/repositories.dart';

part 'bucket_bloc.freezed.dart';

@freezed
sealed class BucketEvent with _$BucketEvent {
  const factory BucketEvent.create(String orgId, Bucket bucket) = CreateBucket;
  const factory BucketEvent.update(String orgId, Bucket bucket) = UpdateBucket;
  const factory BucketEvent.delete(String orgId, String bucketId) = DeleteBucket;
  const factory BucketEvent.loadOrgBuckets(String orgId) = LoadOrgBuckets;
}

@freezed
sealed class BucketState with _$BucketState {
  const factory BucketState.initial() = InitialBucketState;
  const factory BucketState.loading({String? msg}) = LoadingBucketState;
  const factory BucketState.error({required String msg}) = ErrorBucketState;
  const factory BucketState.loaded({required List<Bucket> bucket, int? workOnIndex, String? msg}) =
      LoadedBucketState;
}

class BucketBloc extends Bloc<BucketEvent, BucketState> {
  final BucketRepository repo;
  BucketBloc({required this.repo}) : super(const BucketState.initial()) {
    on<CreateBucket>(_onAddBucket);
    on<UpdateBucket>(_onUpdateBucket);
    on<DeleteBucket>(_onDeleteBucket);
    on<LoadOrgBuckets>(_onLoadBucket);
  }
  void _onAddBucket(CreateBucket event, Emitter<BucketState> emit) async {
    emit(state.maybeMap(
      loaded: (state) => state.copyWith(msg: BucketMessage.creating.message),
      orElse: () => BucketState.loading(msg: BucketMessage.creating.message),
    ));

    try {
      await repo.create(event.orgId, event.bucket);
      emit(state.maybeMap(
        loaded: (state) => state.copyWith(
          bucket: [...state.bucket, event.bucket],
          msg: BucketMessage.created.message,
        ),
        orElse: () => BucketState.loaded(bucket: [event.bucket], msg: BucketMessage.created.message),
      ));
    } catch (e) {
      emit(state.maybeMap(
        loaded: (state) => state.copyWith(msg: BucketMessage.creating.getErrorMessage(e)),
        orElse: () => BucketState.error(msg: BucketMessage.creating.getErrorMessage(e)),
      ));
    }
  }

  void _onUpdateBucket(UpdateBucket event, Emitter<BucketState> emit) async {
    emit(state.maybeMap(
      loaded: (state) => state.copyWith(
          msg: BucketMessage.updating.message,
          workOnIndex: state.bucket.indexWhere((e) => e.bucketId == event.bucket.bucketId)),
      orElse: () => BucketState.loading(msg: BucketMessage.updating.message),
    ));

    try {
      await repo.update(event.orgId, event.bucket);
      final buckets = await repo.getBucketsByOrgId(event.orgId);
      emit(state.maybeMap(
        loaded: (state) =>
            state.copyWith(bucket: buckets, msg: BucketMessage.updated.message, workOnIndex: null),
        orElse: () => BucketState.loaded(bucket: buckets, msg: BucketMessage.updated.message),
      ));
    } catch (e) {
      emit(state.maybeMap(
        loaded: (state) => state.copyWith(msg: BucketMessage.updating.getErrorMessage(e), workOnIndex: null),
        orElse: () => BucketState.error(msg: BucketMessage.updating.getErrorMessage(e)),
      ));
    }
  }

  void _onDeleteBucket(DeleteBucket event, Emitter<BucketState> emit) async {
    emit(state.maybeMap(
      loaded: (state) => state.copyWith(
          msg: BucketMessage.deleting.message,
          workOnIndex: state.bucket.indexWhere((e) => e.bucketId == event.bucketId)),
      orElse: () => BucketState.loading(msg: BucketMessage.deleting.message),
    ));

    try {
      await repo.delete(event.orgId, event.bucketId);
      final buckets = await repo.getBucketsByOrgId(event.orgId);
      emit(state.maybeMap(
        loaded: (state) =>
            state.copyWith(bucket: buckets, msg: BucketMessage.deleted.message, workOnIndex: null),
        orElse: () => BucketState.loaded(bucket: buckets, msg: BucketMessage.deleted.message),
      ));
    } catch (e) {
      emit(state.maybeMap(
        loaded: (state) => state.copyWith(msg: BucketMessage.deleting.getErrorMessage(e), workOnIndex: null),
        orElse: () => BucketState.error(msg: BucketMessage.deleting.getErrorMessage(e)),
      ));
    }
  }

  void _onLoadBucket(LoadOrgBuckets event, Emitter<BucketState> emit) async {
    emit(state.maybeMap(
      loaded: (state) => state.copyWith(msg: BucketMessage.loading.message),
      orElse: () => BucketState.loading(msg: BucketMessage.loading.message),
    ));

    try {
      final buckets = await repo.getBucketsByOrgId(event.orgId);
      emit(state.maybeMap(
        loaded: (state) => state.copyWith(bucket: buckets, msg: BucketMessage.loaded.message),
        orElse: () => BucketState.loaded(bucket: buckets, msg: BucketMessage.loaded.message),
      ));
    } catch (e) {
      emit(state.maybeMap(
        loaded: (state) => state.copyWith(msg: BucketMessage.loading.getErrorMessage(e)),
        orElse: () => BucketState.error(msg: BucketMessage.loading.getErrorMessage(e)),
      ));
    }
  }
}
