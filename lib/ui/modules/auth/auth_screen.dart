import 'package:edukit/ui/modules/auth/auth_form.dart';
import 'package:edukit/ui/modules/auth/auth_form_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../material/scaffold.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthFormCubit(),
      child:  AppScaffold(
          body: Stack(
            fit: StackFit.expand,
            alignment: Alignment.centerLeft,
            children: [Positioned(left: 100, child: AuthenticationForm())],
          ),
        ),
    );
  }
}
