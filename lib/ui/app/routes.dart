import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:edukit/ui/modules/attribute_management/attribute_management_screen.dart';
import 'package:edukit/ui/modules/auth/auth_screen.dart';
import 'package:edukit/ui/modules/create_or_edit_bucket_screen.dart';
import 'package:edukit/ui/modules/files_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/auth',
  observers: [RouteObserver()],
  redirect: (context, state) {
    final status = context.read<AuthCubit>().state.status;
    final isAuthRoute = state.matchedLocation == '/auth';

    if (status == AuthStatus.unauthenticated) {
      return isAuthRoute ? null : '/auth';
    }

    if (status == AuthStatus.authenticated && isAuthRoute) {
      return '/';
    }

    return null;
  },
  routes: [
    GoRoute(path: '/auth', name: 'auth', builder: (context, state) => const AuthScreen()),
    GoRoute(path: '/', name: 'create-bucket', builder: (context, state) => const CreateOrEditBucketScreen()),
    GoRoute(
      path: '/attribute-management',
      name: 'attribute-management',
      builder: (context, state) {
        final bucketId = state.pathParameters['bucketId']!;
        return AttributeManagementScreen(bucketId: bucketId);
      },
    ),
    GoRoute(
      path: '/files-management',
      name: 'files-management',
      builder: (context, state) {
        final bucketId = state.pathParameters['bucketId']!;
        final bucketState = context.read<BucketBloc>().state;

        if (bucketState is LoadedBucketState) {
          final bucket = bucketState.bucket.firstWhere((element) => element.bucketId == bucketId);

          if (bucket.attributes.isEmpty) {
            context.go('/attribute-management', extra: {'bucketId': bucketId});
            return const SizedBox.shrink();
          }

          return FilesManagementScreen(bucketId: bucketId);
        }

        return const SizedBox.shrink();
      },
    ),
  ],
);
