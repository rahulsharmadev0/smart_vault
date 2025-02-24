import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edukit/ui/app/routes.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:edukit/ui/material/scaffold.dart';
import 'package:edukit/ui/modules/attribute_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AttributeManagementScreen extends StatefulWidget {
  final String bucketId;
  const AttributeManagementScreen({super.key, required this.bucketId});

  @override
  State<AttributeManagementScreen> createState() => _AttributeManagementScreenState();
}

class _AttributeManagementScreenState extends State<AttributeManagementScreen> {
  late AttributeManagementCubit cubit;

  @override
  void initState() {
    cubit = AttributeManagementCubit(widget.bucketId, context.read<BucketBloc>());
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttributeManagementCubit, AttributeManagementState>(
      bloc: cubit,
      builder: (context, state) {
        var textTheme2 = Theme.of(context).textTheme;
        return AppScaffold(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(cubit.title, style: textTheme2.titleMedium),
                    IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () =>
                            context.pushNamed('edit-bucket', pathParameters: {'bucketId': widget.bucketId})),
                  ],
                ),
                Text(cubit.description, style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
            body: ListView(
              children: [
                for (var i = 0; i < state.length; i++)
                  ListTile(
                    title: Text(state[i].name),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => cubit.removeAttribute(i),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () =>
                      context.pushNamed('add-attribute', pathParameters: {'bucketId': widget.bucketId}),
                  child: Text('Add Attribute'),
                ),
              ],
            ));
      },
    );
  }
}
