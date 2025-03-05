import 'package:bloc_suite/bloc_suite.dart';
import 'package:edukit/ui/bloc/_messages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/models.dart';
import 'package:repositories/repositories.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:edukit/ui/bloc/organization_bloc.dart';

part 'bucket_bloc.freezed.dart';

@freezed
sealed class BucketEvent extends LifecycleEvent with _$BucketEvent {
  @override
  final void Function()? onSuccess;
  @override
  final void Function()? onCompleted;
  @override
  final Function(dynamic error)? onError;

  BucketEvent._({this.onCompleted, this.onError, this.onSuccess})
    : super(onCompleted: onCompleted, onError: onError, onSuccess: onSuccess);

  factory BucketEvent.create(
    String orgId,
    Bucket bucket, {
    void Function()? onCompleted,
    dynamic Function(dynamic)? onError,
    void Function()? onSuccess,
  }) = CreateBucket;
  factory BucketEvent.update(
    String orgId,
    Bucket bucket, {
    void Function()? onCompleted,
    dynamic Function(dynamic)? onError,
    void Function()? onSuccess,
  }) = UpdateBucket;
  factory BucketEvent.delete(
    String orgId,
    String bucketId, {
    void Function()? onCompleted,
    dynamic Function(dynamic)? onError,
    void Function()? onSuccess,
  }) = DeleteBucket;
  factory BucketEvent.loadOrgBuckets(
    String orgId, {
    void Function()? onCompleted,
    dynamic Function(dynamic)? onError,
    void Function()? onSuccess,
  }) = LoadOrgBuckets;
}

@freezed
sealed class BucketState with _$BucketState {
  const factory BucketState.loading({String? msg}) = LoadingBucketState;
  const factory BucketState.error({required String msg}) = ErrorBucketState;
  const factory BucketState.loaded({required List<Bucket> bucket, int? workOnIndex, String? msg}) =
      LoadedBucketState;
}

extension BucketStateExt on BucketState {
  T map<T>({
    T Function(LoadingBucketState)? loading,
    T Function(ErrorBucketState)? error,
    T Function(LoadedBucketState)? loaded,
    T Function()? orElse,
  }) {
    // ignore: no_leading_underscores_for_local_identifiers
    T _else() => orElse?.call() ?? (throw StateError('Unhandled state type: $runtimeType'));
    return switch (this) {
      LoadingBucketState value => loading?.call(value) ?? _else(),
      ErrorBucketState value => error?.call(value) ?? _else(),
      LoadedBucketState value => loaded?.call(value) ?? _else(),
      _ => throw StateError('Unhandled state type: $runtimeType'),
    };
  }
}
//==============================================================
//                        BucketBloc
//==============================================================

class BucketBloc extends Bloc<BucketEvent, BucketState> {
  final BucketRepository repo;
  final OrganizationBloc organizationBloc;
  StreamSubscription? _organizationSubscription;

  bool get isLoaded => state is LoadedBucketState;
  List<Bucket> get buckets => (state as LoadedBucketState).bucket;

  BucketBloc({required this.repo, required this.organizationBloc}) : super(const BucketState.loading()) {
    on<CreateBucket>(_onAddBucket);
    on<UpdateBucket>(_onUpdateBucket);
    on<DeleteBucket>(_onDeleteBucket);
    on<LoadOrgBuckets>(_onLoadBucket);

    // Listen to organization state changes
    _organizationSubscription = organizationBloc.stream.listen(_fetchBucketsOnOrgLoaded);

    // Check if organization is already loaded
    _fetchBucketsOnOrgLoaded(organizationBloc.state);
  }

  void _fetchBucketsOnOrgLoaded(OrganizationState orgState) {
    if (state is! LoadedBucketState && orgState is OrganizationLoadedState) {
      add(LoadOrgBuckets(orgState.organization.orgId));
    }
  }

  void _onAddBucket(CreateBucket event, Emitter<BucketState> emit) async {
    emit(
      state.map(
        loaded: (state) => state.copyWith(msg: BucketMessage.creating.message),
        orElse: () => BucketState.loading(msg: BucketMessage.creating.message),
      ),
    );

    try {
      await repo.create(event.bucket);
      emit(
        state.map(
          loaded: (state) {
            return state.copyWith(
              bucket: [...state.bucket, event.bucket],
              msg: BucketMessage.created.message,
            );
          },
          orElse: () => BucketState.loaded(bucket: [event.bucket], msg: BucketMessage.created.message),
        ),
      );
    } catch (e) {
      emit(
        state.map(
          loaded: (state) => state.copyWith(msg: BucketMessage.creating.getErrorMessage(e)),
          orElse: () => BucketState.error(msg: BucketMessage.creating.getErrorMessage(e)),
        ),
      );
    }
  }

  void _onUpdateBucket(UpdateBucket event, Emitter<BucketState> emit) async {
    emit(
      state.map(
        loaded: (state) {
          return state.copyWith(
            msg: BucketMessage.updating.message,
            workOnIndex: state.bucket.indexWhere((e) => e.bucketId == event.bucket.bucketId),
          );
        },
        orElse: () => BucketState.loading(msg: BucketMessage.updating.message),
      ),
    );

    try {
      await repo.update(event.bucket);
      final buckets = await repo.getBucketsByOrgId(event.orgId);
      emit(
        state.map(
          loaded: (state) {
            return state.copyWith(bucket: buckets, msg: BucketMessage.updated.message, workOnIndex: null);
          },
          orElse: () => BucketState.loaded(bucket: buckets, msg: BucketMessage.updated.message),
        ),
      );
    } catch (e) {
      emit(
        state.map(
          loaded: (state) {
            return state.copyWith(msg: BucketMessage.updating.getErrorMessage(e), workOnIndex: null);
          },
          orElse: () => BucketState.error(msg: BucketMessage.updating.getErrorMessage(e)),
        ),
      );
    }
  }

  void _onDeleteBucket(DeleteBucket event, Emitter<BucketState> emit) async {
    emit(
      state.map(
        loaded:
            (state) => state.copyWith(
              msg: BucketMessage.deleting.message,
              workOnIndex: state.bucket.indexWhere((e) => e.bucketId == event.bucketId),
            ),
        orElse: () => BucketState.loading(msg: BucketMessage.deleting.message),
      ),
    );

    try {
      await repo.delete(event.bucketId);
      final buckets = await repo.getBucketsByOrgId(event.orgId);
      emit(
        state.map(
          loaded:
              (state) =>
                  state.copyWith(bucket: buckets, msg: BucketMessage.deleted.message, workOnIndex: null),
          orElse: () => BucketState.loaded(bucket: buckets, msg: BucketMessage.deleted.message),
        ),
      );
    } catch (e) {
      emit(
        state.map(
          loaded:
              (state) => state.copyWith(msg: BucketMessage.deleting.getErrorMessage(e), workOnIndex: null),
          orElse: () => BucketState.error(msg: BucketMessage.deleting.getErrorMessage(e)),
        ),
      );
    }
  }

  void _onLoadBucket(LoadOrgBuckets event, Emitter<BucketState> emit) async {
    emit(
      state.map(
        loaded: (state) => state.copyWith(msg: BucketMessage.loading.message),
        orElse: () => BucketState.loading(msg: BucketMessage.loading.message),
      ),
    );

    try {
      final buckets = await repo.getBucketsByOrgId(event.orgId);
      emit(
        state.map(
          loaded: (state) => state.copyWith(bucket: buckets, msg: BucketMessage.loaded.message),
          orElse: () => BucketState.loaded(bucket: buckets, msg: BucketMessage.loaded.message),
        ),
      );
    } catch (e) {
      emit(
        state.map(
          loaded: (state) => state.copyWith(msg: BucketMessage.loading.getErrorMessage(e)),
          orElse: () => BucketState.error(msg: BucketMessage.loading.getErrorMessage(e)),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _organizationSubscription?.cancel();
    return super.close();
  }
}
