import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:edukit/ui/modules/attribute_management/attribute_management_screen.dart';
import 'package:edukit/ui/modules/auth/auth_screen.dart';
import 'package:edukit/ui/modules/create_bucket/create_or_edit_bucket_screen.dart';
import 'package:edukit/ui/modules/bucket_screen/bucket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  observers: [RouteObserver()],
  redirect: (context, state) {
    // Get state from BLoCs
    final authCubit = context.read<AuthCubit>();
    final isAuthRoute = state.matchedLocation == '/auth';

    // Logic for unauthenticated users - direct to auth
    if (authCubit.isUnauthenticated && !isAuthRoute) {
      return '/auth';
    }

    // Default - no redirection needed
    return null;
  },

  routes: [
    GoRoute(path: '/auth', name: 'auth', builder: (context, state) => const AuthScreen()),

    GoRoute(path: '/', name: 'home', builder: (_, _) => const FilesManagementScreen()),
    GoRoute(
      path: '/create-bucket',
      name: 'create-bucket',
      builder: (context, state) => const CreateOrEditBucketScreen(),
    ),

    GoRoute(
      path: '/attribute-management/:bucketId',
      name: 'attribute-management',
      builder: (_, state) => AttributeManagementScreen(bucketId: state.pathParameters['bucketId']!),
    ),

    GoRoute(
      path: '/:bucketId',
      name: 'bucket',
      builder: (context, state) => FilesManagementScreen(bucketId: state.pathParameters['bucketId']),
    ),
  ],
);
