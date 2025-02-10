import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:edukit/ui/modules/auth/auth_screen.dart';
import 'package:edukit/ui/modules/create_or_edit_bucket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
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
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) => AuthScreen(),
    ),
    GoRoute(
      path: '/',
      name: 'create-bucket',
      builder: (context, state) => CreateOrEditBucketScreen(),
    )
  ],
);
