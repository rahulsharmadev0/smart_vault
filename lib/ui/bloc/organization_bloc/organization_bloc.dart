import 'package:bloc_suite/bloc_suite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/models.dart';
import 'package:equatable/equatable.dart';

part 'organization_event.dart';

typedef _OrgEmit = Emitter<BlocState<Organization>?>;

class OrganizationBloc extends Bloc<OrganizationEvent, BlocState<Organization>> {
  OrganizationRepository repo;
  OrganizationBloc({required this.repo}) : super(BlocStateInitial()) {
    on<LoadOrganization>(_onLoadOrganization);
    on<UpdateName>(_onUpdateName);
    on<UpdateDescription>(_onUpdateDescription);
    on<AddBucket>(_onAddBucket);
    on<RemoveBucket>(_onRemoveBucket);
    on<UpdateBucket>(_onUpdateBucket);
  }

  Future<void> _handleOperation(_OrgEmit emit, Function(_OrgEmit emit) operation) async {
    try {
      await operation(emit);
    } catch (e) {
      if (state is BlocStateSuccess<Organization>) {
        var state = this.state as BlocStateSuccess<Organization>;
        emit(BlocStateSuccess(state.data, message: e.toString()));
      } else {
        emit(BlocStateFailure(e.toString()));
      }
    }
  }

  void _onLoadOrganization(LoadOrganization event, _OrgEmit emit) async {
    await _handleOperation(emit, (emit) async {
      final org = await repo.get(event.value);
      emit(BlocStateSuccess(org));
    });
  }

  void _onUpdateName(UpdateName event, _OrgEmit emit) async {
    if (state is! BlocStateSuccess) return;

    await _handleOperation(emit, (emit) async {
      var state = this.state as BlocStateSuccess<Organization>;
      var newOrg = state.data.copyWith(name: event.value);
      emit(BlocStateSuccess(newOrg));
      await repo.update(newOrg);
    });
  }

  void _onUpdateDescription(UpdateDescription event, _OrgEmit emit) {
    if (state is! BlocStateSuccess) return;
  }

  void _onAddBucket(AddBucket event, _OrgEmit emit) async {
    if (state is! BlocStateSuccess) return;
    await _handleOperation(emit, (emit) async {
      var state = this.state as BlocStateSuccess<Organization>;
      var newOrg = state.data.addBucket(event.value);
      emit(BlocStateSuccess(newOrg));
      await repo.update(newOrg);
    });
  }

  void _onRemoveBucket(RemoveBucket event, _OrgEmit emit) async {
    if (state is! BlocStateSuccess) return;

    await _handleOperation(emit, (emit) async {
      var state = this.state as BlocStateSuccess<Organization>;
      var newOrg = state.data.removeBucket(event.value);
      emit(BlocStateSuccess(newOrg));
    });
  }

  void _onUpdateBucket(UpdateBucket event, _OrgEmit emit) async {
    if (state is! BlocStateSuccess) return;

    await _handleOperation(emit, (emit) async {
      var state = this.state as BlocStateSuccess<Organization>;
      var newOrg = state.data.updateBucket(event.value);
      emit(BlocStateSuccess(newOrg));
    });
  }
}
