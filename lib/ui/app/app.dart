import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  GlobalKey<ScaffoldMessengerState> get msgKey => _scaffoldMessengerKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) => router.go('/'),
      child: MaterialApp.router(
        scaffoldMessengerKey: _scaffoldMessengerKey,
        theme: ThemeData(primarySwatch: Colors.blue, visualDensity: VisualDensity.adaptivePlatformDensity),
        routerConfig: router,
      ),
    );
  }
}
