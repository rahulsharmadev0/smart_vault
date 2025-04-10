import 'package:dart_suite/dart_suite.dart';
import 'package:edukit/ui/modules/bucket_screen/bloc/bucket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:repositories/models/organization.dart';
import 'package:repositories/repositories.dart';
import 'package:edukit/ui/app/routes.dart';

class AppNavigationRail extends StatelessWidget {
  const AppNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current bucket ID from route
    final String currentPath = GoRouterState.of(context).uri.toString();
    final String currentBucketId = _extractBucketIdFromPath(currentPath);

    var state = context.read<BucketBloc>().state as BucketLoaded;
    var buckets = state.buckets;

    // Find the index of the currently selected bucket
    final selectedIndex = buckets.indexWhere(
      (bucket) => bucket.bucketId == currentBucketId,
    );

    return NavigationRail(
      selectedIndex: selectedIndex >= 0 ? selectedIndex : 0,
      onDestinationSelected: (int index) {
        if (index >= 0 && index < buckets.length) {
          // Navigate to the selected bucket
          context.go(AppRoutes.I.bucket(buckets[index].bucketId));
        }
      },
      labelType: NavigationRailLabelType.all,
      destinations: <NavigationRailDestination>[
        for (final bucket in buckets)
          NavigationRailDestination(
            icon: Icon(Icons.folder_outlined),
            selectedIcon: Icon(Icons.folder),
            label: Text(bucket.title),
          ),
      ],

      leading: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          onPressed: () {
            context.go(AppRoutes.I.createBucket());
          },
          tooltip: 'Create Bucket',
          child: const Icon(Icons.add),
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: authRepo.signOut,
          tooltip: 'Sign Out',
        ),
      ),
    );
  }

  // Helper method to extract bucket ID from the current path
  String _extractBucketIdFromPath(String path) {
    return path.split('/').lastWhere((segment) => segment.isNotEmpty, orElse: () => '');
  }
}
