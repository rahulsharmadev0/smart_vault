import 'package:edukit/ui/material/scaffold.dart';
import 'package:edukit/ui/modules/ai_chat/ai_chat_screen.dart';
import 'package:edukit/ui/modules/attribute_management/attribute_management_screen.dart';
import 'package:edukit/ui/modules/auth/auth_screen.dart';
import 'package:edukit/ui/modules/bucket_screen/bucket_screen.dart';
import 'package:edukit/ui/modules/create_bucket/create_or_edit_bucket_screen.dart';
import 'package:edukit/ui/utils/streamtolistenable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_suite/flutter_suite.dart';
import 'package:go_router/go_router.dart';
import 'package:repositories/repositories.dart';

final class AppRoutes with PathRoutes {
  AppRoutes._();

  static final I = AppRoutes._();

  final rootNavigatorKey = _createNavigatorKey();
  final shellNavigatorKey = _createNavigatorKey();
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  late final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: home(),
    debugLogDiagnostics: true,
    observers: [RouteNavigatorObserver()],
    refreshListenable: StreamToListenable(authRepo.isSignedIn),
    redirect: (context, state) {
      final isAuthRoute = state.matchedLocation == '/auth';
      // Logic for unauthenticated users - direct to auth
      if (!authRepo.hasActiveSession && !isAuthRoute) {
        return '/auth';
      }

      // Default - no redirection needed
      return null;
    },

    routes: [
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/chat',
        name: 'chat',
        builder: (context, state) => AiChatScreen(filePath: state.extra as String),
      ),

      ShellRoute(
        navigatorKey: shellNavigatorKey,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, child) => AppScaffold(body: child),
        routes: [
          GoRoute(
            path: '/attribute-management/:bucketId',
            name: 'attribute-management',
            builder:
                (_, state) =>
                    AttributeManagementScreen(state.pathParameters['bucketId']!),
          ),
          GoRoute(
            path: '/create-bucket',
            name: 'create-bucket',
            builder: (context, state) => const CreateOrEditBucketScreen(),
          ),

          GoRoute(
            path: '/:bucketId',
            name: 'bucket',
            builder:
                (context, state) =>
                    BucketScreen(bucketId: state.pathParameters['bucketId']!),
          ),
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => BucketScreen(bucketId: ""),
          ),
        ],
      ),
    ],
  );
}

mixin PathRoutes {
  String home() => '/';
  String auth() => '/auth';
  String createBucket() => '/create-bucket';
  String bucket(String bucketId) => '/$bucketId';
  String attributeManagement(String bucketId) => '/attribute-management/$bucketId';

  // String chat() => _appendToCurrentPath('chat');

  String _appendToCurrentPath(String newPath) {
    final newPathUri = Uri.parse(newPath);
    final currentUri = AppRoutes.I.router.routeInformationProvider.value.uri;
    Map<String, dynamic> params = Map.of(currentUri.queryParameters);
    params.addAll(newPathUri.queryParameters);
    Uri? loc = Uri(
      path: '${currentUri.path}/${newPathUri.path}'.replaceAll('//', '/'),
      queryParameters: params,
    );
    return loc.toString();
  }
}

// ------------------------------------ Utility ------------------------------------
GlobalKey<NavigatorState> _createNavigatorKey() =>
    GlobalKey<NavigatorState>(debugLabel: 'root');
