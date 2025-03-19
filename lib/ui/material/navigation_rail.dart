import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:repositories/repositories.dart';

class AppNavigationRail extends StatefulWidget {
  const AppNavigationRail({super.key});

  @override
  State<AppNavigationRail> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends State<AppNavigationRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ;

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
            ...p0.bucket.map(
              (e) => NavigationRailDestination(
                icon: Icon(Icons.business_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text(e.title),
              ),
            ),
          ],
          trailing: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: authRepo.signOut, //! Direct Use of Repository
          ),
        );
      },
    );
  }
}
