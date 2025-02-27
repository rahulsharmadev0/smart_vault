import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/models.dart';
import '_messages.dart';

part 'organization_bloc.freezed.dart';

@freezed
sealed class OrganizationEvent with _$OrganizationEvent {
  const factory OrganizationEvent.loadOrganization(String value) = LoadOrganization;
  const factory OrganizationEvent.updateName(String value) = UpdateName;
  const factory OrganizationEvent.updateDescription(String value) = UpdateDescription;
}

@freezed
sealed class OrganizationState with _$OrganizationState {
  const factory OrganizationState.initial() = OrgInitialState;
  const factory OrganizationState.loading({String? msg}) = OrgLoadingState;
  const factory OrganizationState.error({required String msg}) = OrgErrorState;
  const factory OrganizationState.loaded({required Organization organization, String? msg}) = OrgLoadedState;
}

extension OrganizationStateExt on OrganizationState {
  T map<T>({
    T Function(OrgInitialState)? initial,
    T Function(OrgLoadingState)? loading,
    T Function(OrgErrorState)? error,
    T Function(OrgLoadedState)? loaded,
    T Function()? orElse,
  }) {
    // ignore: no_leading_underscores_for_local_identifiers
    T _else() => orElse?.call() ?? (throw StateError('Unhandled state type: $runtimeType'));

    return switch (this) {
      OrgInitialState value => initial?.call(value) ?? _else(),
      OrgLoadingState value => loading?.call(value) ?? _else(),
      OrgErrorState value => error?.call(value) ?? _else(),
      OrgLoadedState value => loaded?.call(value) ?? _else(),
    };
  }
}

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  final OrganizationRepository repo;
  Organization? _cachedOrg;

  String get orgId {
    if (state is! OrgLoadedState) throw Exception('Organization not loaded');
    return (state as OrgLoadedState).organization.orgId;
  }

  OrganizationBloc({required this.repo}) : super(const OrganizationState.initial()) {
    on<LoadOrganization>(_onLoadOrganization);
    on<UpdateName>(_onUpdateName);
    on<UpdateDescription>(_onUpdateDescription);
  }

  Future<void> _onLoadOrganization(LoadOrganization event, Emitter<OrganizationState> emit) async {
    try {
      emit(
        state.map(
          initial: (_) => OrganizationState.loading(msg: OrganizationMessage.loading.message),
          loaded: (state) => state.copyWith(msg: OrganizationMessage.loading.message),
          orElse: () => state,
        ),
      );

      final org = await repo.get(event.value);
      _cachedOrg = org;

      emit(OrganizationState.loaded(organization: org, msg: OrganizationMessage.loaded.message));
    } catch (e) {
      emit(
        state.map(
          loaded: (state) => state.copyWith(msg: OrganizationMessage.loading.getErrorMessage(e)),
          orElse: () => OrganizationState.error(msg: OrganizationMessage.loading.getErrorMessage(e)),
        ),
      );
    }
  }

  Future<void> _onUpdateName(UpdateName event, Emitter<OrganizationState> emit) async {
    if (_cachedOrg == null) return;

    try {
      emit(
        state.map(
          loaded: (state) => state.copyWith(msg: OrganizationMessage.updating.message),
          orElse: () => state,
        ),
      );

      final updatedOrg = _cachedOrg!.copyWith(name: event.value);
      await repo.update(updatedOrg);
      _cachedOrg = updatedOrg;

      emit(OrganizationState.loaded(organization: updatedOrg, msg: OrganizationMessage.updated.message));
    } catch (e) {
      emit(
        state.map(
          loaded: (state) => state.copyWith(msg: OrganizationMessage.updating.getErrorMessage(e)),
          orElse: () => state,
        ),
      );
    }
  }

  Future<void> _onUpdateDescription(UpdateDescription event, Emitter<OrganizationState> emit) async {
    if (_cachedOrg == null) return;

    try {
      emit(
        state.map(
          loaded: (state) => state.copyWith(msg: OrganizationMessage.updating.message),
          orElse: () => state,
        ),
      );

      final updatedOrg = _cachedOrg!.copyWith(description: event.value);
      await repo.update(updatedOrg);
      _cachedOrg = updatedOrg;

      emit(OrganizationState.loaded(organization: updatedOrg, msg: OrganizationMessage.updated.message));
    } catch (e) {
      emit(
        state.map(
          loaded: (state) => state.copyWith(msg: OrganizationMessage.updating.getErrorMessage(e)),
          orElse: () => state,
        ),
      );
    }
  }
}
