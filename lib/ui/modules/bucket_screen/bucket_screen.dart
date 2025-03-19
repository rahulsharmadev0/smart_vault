import 'package:collection/collection.dart';
import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:edukit/ui/bloc/bucket_bloc';
import 'package:edukit/ui/bloc/organization_bloc.dart';
import 'package:edukit/ui/material/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:repositories/models/organization.dart';

class FilesManagementScreen extends StatelessWidget {
  final String? bucketId;
  const FilesManagementScreen({super.key, this.bucketId});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      titleText: 'Files Management',
      body: BlocListener(
        bloc: context.read<OrganizationBloc>(),
        listener: (context, state) {
          if (state is! OrganizationLoadedState) context.read<AuthCubit>().signOut();
        },
        child: BlocConsumer<BucketBloc, BucketState>(
          listener: (context, state) {
            if (state is LoadedBucketState) {
              if (state.bucket.isEmpty) {
                context.goNamed('create-bucket');
              } else if (state.bucket.length == 1) {
                final currentBucket =
                    state.bucket.firstWhereOrNull((o) => o.bucketId == bucketId) ??
                    state.bucket.first;
                context.goNamed(
                  'bucket',
                  pathParameters: {'bucketId': currentBucket.bucketId},
                );
              } else if (bucketId == null) {
                final currentBucket =
                    bucketId == null
                        ? state.bucket.first
                        : state.bucket.firstWhereOrNull((o) => o.bucketId == bucketId) ??
                            state.bucket.first;
                context.goNamed(
                  'bucket',
                  pathParameters: {'bucketId': currentBucket.bucketId},
                );
              }
            }
          },
          builder: (context, state) {
            if (state is ErrorBucketState) {
              return Center(child: Text('Error: ${state.msg}'));
            } else if (state is LoadedBucketState) {
              final currentBucket =
                  state.bucket.firstWhereOrNull((o) => o.bucketId == bucketId) ??
                  state.bucket.first;
              return _BucketScreen(currentBucket);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class _BucketScreen extends StatelessWidget {
  final Bucket bucket;
  const _BucketScreen(this.bucket);

  @override
  Widget build(BuildContext context) {
    if (bucket.attributes.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.goNamed(
          'attribute-management',
          pathParameters: {'bucketId': bucket.bucketId},
        );
      });
    }
    return Center(child: Text('Bucket: ${bucket.toJson()}'));
  }
}
