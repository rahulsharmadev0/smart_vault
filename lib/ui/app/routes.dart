import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:edukit/ui/bloc/organization_bloc.dart';
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
  initialLocation: '/auth',
  debugLogDiagnostics: true,
  observers: [RouteObserver()],
  redirect: (context, state) {
    // Get state from BLoCs
    final authCubit = context.read<AuthCubit>();
    final orgBloc = context.read<OrganizationBloc>();
    final isAuthRoute = state.matchedLocation == '/auth';
    final isLoadOrgRoute = state.matchedLocation == '/load-org';

    // Logic for unauthenticated users - direct to auth
    if (authCubit.isUnauthenticated) {
      return isAuthRoute ? null : '/auth';
    }

    // When authenticated but on auth route - redirect to proper location
    if (authCubit.isAuthenticated && isAuthRoute) {
      return !orgBloc.isLoaded ? '/load-org' : '/';
    }

    // If organization isn't loaded yet but user is authenticated
    if (authCubit.isAuthenticated && !orgBloc.isLoaded && !isLoadOrgRoute) {
      return '/load-org';
    }

    // Default - no redirection needed
    return null;
  },

  routes: [
    GoRoute(path: '/auth', name: 'auth', builder: (context, state) => const AuthScreen()),

    GoRoute(
      path: '/create-bucket',
      name: 'create-bucket',
      builder: (context, state) => const CreateOrEditBucketScreen(),
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
      path: '/',
      builder: (context, state) {
        return const FilesManagementScreen();
      },
    ),

    GoRoute(
      path: '/:bucketId',
      builder: (context, state) {
        return FilesManagementScreen(bucketId: state.pathParameters['bucketId']);
      },
    ),
  ],
);
