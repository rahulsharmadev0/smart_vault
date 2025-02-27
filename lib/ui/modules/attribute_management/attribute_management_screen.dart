import 'package:bloc_suite/bloc_suite.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:edukit/ui/modules/attribute_management/attribute_management_bloc.dart';
import 'package:flutter/material.dart';
import 'package:repositories/models/organization.dart';

typedef _AttributeManagementBlocBuilder = BlocWidget<AttributeManagementBloc, AttributeManagementState>;

typedef _AttributeManagementBlocSelector =
    BlocSelectorWidget<AttributeManagementBloc, AttributeManagementState, List<Attribute>>;

// =========================================

class AttributeManagementWidget extends _AttributeManagementBlocBuilder {
  final String bucketId;
  final BucketBloc bucketBloc;
  AttributeManagementWidget({super.key, required this.bucketId, required this.bucketBloc})
    : super(
        bloc: AttributeManagementBloc(bucketId: bucketId, bucketBloc: bucketBloc),

        //Note: Widget not rebuilt when the state is the same
        buildWhen: (p0, p1) => p0.runtimeType != p1.runtimeType,
      );

  @override
  Widget build(BuildContext context, AttributeManagementBloc bloc, AttributeManagementState state) {
    return state.map(
      loading: (_) => CircularProgressIndicator(),
      error: (e) => Text(e.message),
      loaded: (state) {
        return Column(
          spacing: 8,
          children: [
            Text('Fixed Attributes'),
            FixedAttributesListView(),
            SizedBox(height: 12),
            Text('Fixed Attributes'),
            CustomAttributesListView(),
          ],
        );
      },
    );
  }
}

// =========================================
// FixedAttributesListView
// =========================================

class FixedAttributesListView extends _AttributeManagementBlocSelector {
  FixedAttributesListView({super.key, super.bloc})
    : super(selector: (state) => state.map(loaded: (v) => v.fixedAttributes)!);

  @override
  bool get autoClose => false;

  @override
  Widget build(BuildContext context, AttributeManagementBloc bloc, List<Attribute> state) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.length,
      itemBuilder: (context, index) {
        final attribute = state[index];
        return ListTile(title: Text(attribute.label));
      },
    );
  }
}

// =========================================
//  CustomAttributesListView
// =========================================

class CustomAttributesListView extends _AttributeManagementBlocSelector {
  CustomAttributesListView({super.key, super.bloc})
    : super(selector: (state) => state.map(loaded: (v) => v.customAttributes)!);

  @override
  bool get autoClose => false;

  @override
  Widget build(BuildContext context, AttributeManagementBloc bloc, List<Attribute> state) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.length,
      itemBuilder: (context, index) {
        final attribute = state[index];
        return ListTile(title: Text(attribute.label));
      },
    );
  }
}
