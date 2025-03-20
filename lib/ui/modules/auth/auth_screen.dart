import 'package:edukit/ui/modules/auth/auth_form.dart';
import 'package:edukit/ui/modules/auth/auth_form_cubit.dart';
import 'package:edukit/ui/utils/form_submission_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../material/scaffold.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthFormCubit(),
      child: BlocListener<AuthFormCubit, AuthFormState>(
        listener: (context, state) {
          if (state.formState == FormSubmissionStatus.success) {
            GoRouter.of(context).refresh();
          }
        },
        child: AppScaffold(
          body: Stack(
            fit: StackFit.expand,
            alignment: Alignment.centerLeft,
            children: [Positioned(left: 100, child: AuthenticationForm())],
          ),
        ),
      ),
    );
  }
}
