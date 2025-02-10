import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigationRail extends StatelessWidget {
  const AppNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: 0,
      // minWidth: 56.0,
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.business_outlined),
          selectedIcon: Icon(Icons.business),
          label: Text('Business'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.school_outlined),
          selectedIcon: Icon(Icons.school),
          label: Text('School'),
        ),
      ],
      trailing: Align(
        alignment: Alignment.bottomCenter,
        child: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: context.read<AuthCubit>().signOut,
        ),
      ),
    );
  }
}
