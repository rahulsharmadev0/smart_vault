import 'package:bloc_suite/bloc_suite.dart';
import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:edukit/ui/bloc/organization_bloc/organization_bloc.dart';
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
      listener: (context, state) {
        router.refresh();
      },
      child: BlocListener<OrganizationBloc, BlocState>(
        listener: (context, state) {
          if (state is BlocStateFailure) {
            msgKey.currentState!.showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
          if (state is BlocStateSuccess && state.message != null) {
            msgKey.currentState!.showSnackBar(
              SnackBar(content: Text(state.message!), backgroundColor: Colors.red),
            );
          }
        },
        child: MaterialApp.router(
          scaffoldMessengerKey: _scaffoldMessengerKey,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
