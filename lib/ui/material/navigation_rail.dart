import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigationRail extends StatefulWidget {
  const AppNavigationRail({super.key});

  @override
  State<AppNavigationRail> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends State<AppNavigationRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BucketBloc, BucketState>(
      builder: (context, state) {
        return state.map(
          orElse: () => SizedBox.shrink(),
          loaded: (p0) {
            return NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() => _selectedIndex = index);
              },
              labelType: NavigationRailLabelType.all,
              destinations: <NavigationRailDestination>[
                ...p0.buckets.map(
                  (e) => NavigationRailDestination(
                    icon: Icon(Icons.business_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: Text(e.title),
                  ),
                ),
              ],
              trailing: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: context.read<AuthCubit>().signOut,
              ),
            );
          },
        );
      },
    );
  }
}
