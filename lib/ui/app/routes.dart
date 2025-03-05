import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:edukit/ui/bloc/organization_bloc.dart';
import 'package:edukit/ui/modules/attribute_management/attribute_management_screen.dart';
import 'package:edukit/ui/modules/auth/auth_screen.dart';
import 'package:edukit/ui/modules/create_bucket/create_or_edit_bucket_screen.dart';
import 'package:edukit/ui/modules/file_management/files_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/auth',
  observers: [RouteObserver()],
  redirect: (context, state) {
    var auth = context.read<AuthCubit>();
    final isAuthRoute = state.matchedLocation == '/auth';

    if (auth.isUnauthenticated) {
      return isAuthRoute ? null : '/auth';
    }

    if (auth.isAuthenticated && isAuthRoute) {
      return '/';
    }

    return null;
  },

  routes: [
    GoRoute(path: '/auth', name: 'auth', builder: (context, state) => const AuthScreen()),

    GoRoute(
      path: '/create-bucket',
      name: 'create-bucket',
      builder: (context, state) => const CreateOrEditBucketScreen(),

      redirect: (context, state) {
        final status = context.read<AuthCubit>().state.status;
        if (status == AuthStatus.unauthenticated) {
          return '/auth';
        }
        return null;
      },
    ),

    GoRoute(
      path: '/attribute-management/:bucketId',
      name: 'attribute-management',
      builder: (context, state) {
        final bucketId = state.pathParameters['bucketId']!;
        return AttributeManagementScreen(bucketId: bucketId);
      },
    ),

    GoRoute(
      path: '/:bucketId',
      builder: (context, state) {
        return FilesManagementScreen(bucketId: state.pathParameters['bucketId']);
      },

      redirect: (context, state) {
        final org = context.read<OrganizationBloc>();
        if (!org.isLoaded) {
          return '/create-bucket';
        }

        final bucket = context.read<BucketBloc>();

        if (bucket.isLoaded) {
          String? bucketId = state.pathParameters['bucketId'];
          if (bucketId == null || !bucket.buckets.any((b) => b.bucketId == bucketId)) {
            bucketId = bucket.buckets.firstOrNull?.bucketId;
          }
          if (bucketId == null) {
            return '/create-bucket';
          }

          final bk = bucket.buckets.firstWhere((element) => element.bucketId == bucketId);

          if (bk.attributes.isEmpty) {
            return '/attribute-management/$bucketId';
          }
        }

        return null;
      },
    ),
  ],
);
