// ignore_for_file: use_build_context_synchronously

import 'package:bloc_suite/bloc_suite.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:edukit/ui/modules/attribute_management/attribute_management_bloc.dart';
import 'package:edukit/ui/widgets/attribute_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/models/organization.dart';

typedef _AttributeManagementBlocSelector =
    BlocSelectorWidget<AttributeManagementBloc, AttributeManagementState, List<Attribute>>;

// =========================================

class AttributeManagementScreen extends StatelessWidget {
  final String bucketId;
  const AttributeManagementScreen({super.key, required this.bucketId});

  @override
  Widget build(BuildContext context) {
    var read = context.read<BucketBloc>();
    return BlocProvider(
      create: (context) => AttributeManagementBloc(bucketId: bucketId, bucketBloc: read),
      child: BlocBuilder<AttributeManagementBloc, AttributeManagementState>(
        //Note: Widget not rebuilt when the state is the same
        buildWhen: (p0, p1) => p0.runtimeType != p1.runtimeType,
        builder: (context, state) {
          return state.map(
            loading: (_) => CircularProgressIndicator(),
            error: (e) => Text(e.message),
            loaded: (state) {
              return Column(
                spacing: 8,
                children: [
                  Align(alignment: Alignment.centerRight, child: AddAttributeButton()),
                  Text('Fixed Attributes'),
                  FixedAttributesListView(),
                  SizedBox(height: 12),
                  Text('Fixed Attributes'),
                  CustomAttributesListView(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class AddAttributeButton extends BlocWidget<AttributeManagementBloc, AttributeManagementState> {
  const AddAttributeButton({super.key});

  @override
  Widget build(context, attributeManagementBloc, state) {
    void onTap(AttributeType type) async {
      Attribute? attribute = switch (type) {
        AttributeType.text => await showDialog<Attribute?>(
          context: context,
          builder: (ctx) => AttributeDialog(),
        ),
        AttributeType.singleSelect => await showDialog<Attribute?>(
          context: context,
          builder: (ctx) => AttributeDialog(),
        ),
        AttributeType.multiSelect => await showDialog<Attribute?>(
          context: context,
          builder: (ctx) => AttributeDialog.withOptions(),
        ),
        AttributeType.dateTime => await showDialog<Attribute?>(
          context: context,
          builder: (ctx) => AttributeDialog(),
        ),
      };

      if (attribute != null) {
        attributeManagementBloc.add(AttributeManagementEvent.add(attribute));
      }
    }

    return PopupMenuButton<AttributeType>(
      itemBuilder: (context) {
        return AttributeType.values.map((e) {
          return PopupMenuItem(value: e, child: Text('${e.name} Attribute'));
        }).toList();
      },
      onSelected: onTap,
    );
  }
}

// =========================================
// FixedAttributesListView
// =========================================

class FixedAttributesListView extends _AttributeManagementBlocSelector {
  FixedAttributesListView({super.key})
    : super(selector: (state) => state.map(loaded: (v) => v.fixedAttributes)!);

  @override
  bool get autoClose => false;

  @override
  Widget build(context, bloc, state) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.length,
      itemBuilder: (context, index) {
        return AttributesTile(attribute: state[index]);
      },
    );
  }
}

// =========================================
//  CustomAttributesListView
// =========================================

class CustomAttributesListView extends _AttributeManagementBlocSelector {
  CustomAttributesListView({super.key})
    : super(selector: (state) => state.map(loaded: (v) => v.customAttributes)!);

  @override
  bool get autoClose => false;

  @override
  Widget build(context, bloc, state) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.length,
      itemBuilder: (context, index) {
        return AttributesTile(attribute: state[index]);
      },
    );
  }
}

class AttributesTile extends StatelessWidget {
  final Attribute attribute;
  final VoidCallback? onEdit, onDelete;
  const AttributesTile({super.key, required this.attribute, this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return attribute.map(
      text: (attribute) => tile(attribute.label, 'Text'),
      dateTime: (attribute) => tile(attribute.label, 'DateTime'),
      singleSelect: (attribute) => tile(attribute.label, 'Single Select'),
      multiSelect: (attribute) => tile(attribute.label, 'Multi Select'),
      orElse: () => Container(),
    );
  }

  Widget tile(String title, String label) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      child: Row(
        spacing: 8,
        children: [
          Text(title),
          Spacer(),
          Chip(label: Text(label)),
          IconButton(icon: Icon(Icons.edit), onPressed: onEdit),
          IconButton(icon: Icon(Icons.delete), onPressed: onDelete),
        ],
      ),
    );
  }
}
