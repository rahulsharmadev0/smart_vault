// ignore_for_file: use_build_context_synchronously

import 'package:bloc_suite/bloc_suite.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:edukit/ui/material/scaffold.dart';
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
          return AppScaffold(
            titleText: 'Attribute Management',
            body: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [AddAttributeButton()]),
                Text('Fixed Attributes'),
                FixedAttributesListView(),
                SizedBox(height: 12),
                Text('Fixed Attributes'),
                CustomAttributesListView(),
              ],
            ),
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
          builder: (ctx) => AttributeDialog.withOptions(),
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
      borderRadius: BorderRadius.circular(8),
      style: FilledButton.styleFrom(),
      icon: Row(spacing: 4, children: [Icon(Icons.add), Text('Attribute')]),
    );
  }
}

// =========================================
// FixedAttributesListView
// =========================================

class FixedAttributesListView extends _AttributeManagementBlocSelector {
  FixedAttributesListView({super.key})
    : super(selector: (state) => state.map(loaded: (v) => v.fixedAttributes, orElse: () => []));

  @override
  bool get autoClose => false;

  @override
  Widget build(context, bloc, state) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: state.length,
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemBuilder: (context, index) {
        return AttributesTile(
          attribute: state[index],
          onEdit: () async {
            final value = await showDialog<Attribute?>(
              context: context,
              builder: (ctx) => AttributeDialog(label: state[index].label),
            );
            if (value != null) {
              bloc.add(AttributeManagementEvent.update(value));
            }
          },
        );
      },
    );
  }
}

// =========================================
//  CustomAttributesListView
// =========================================

class CustomAttributesListView extends _AttributeManagementBlocSelector {
  CustomAttributesListView({super.key})
    : super(selector: (state) => state.map(loaded: (v) => v.customAttributes, orElse: () => []));

  @override
  bool get autoClose => false;

  @override
  Widget build(context, bloc, state) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: state.length,
      separatorBuilder: (context, index) => SizedBox(height: 8),
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
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      alignment: Alignment.centerLeft,
      color: Colors.grey[200],
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
