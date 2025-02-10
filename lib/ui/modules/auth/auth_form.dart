// Create login form & register form
import 'package:edukit/ui/modules/auth/auth_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({super.key});

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isSignInMode = context.select((AuthFormCubit bloc) => bloc.state.isSignInMode)!;
    return SizedBox(
      width: 600,
      child: Column(
        spacing: 12,
        children: [
          _AuthFormHeader(isSignInMode),
          SizedBox(height: 12),
          if (!isSignInMode) OrganisationNameField(),
          EmailField(),
          PasswordField(),
          if (!isSignInMode) ConfirmPasswordField(),
          _ActionButtons(isSignInMode),
        ],
      ),
    );
  }
}

class _AuthFormHeader extends StatelessWidget {
  final bool isSignInMode;
  const _AuthFormHeader(this.isSignInMode);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: TextStyle(fontSize: 24),
      TextSpan(
        children: [
          TextSpan(text: isSignInMode ? 'Sign in to ' : 'Register to '),
          TextSpan(
            text: 'Edukit',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final bool isSignInMode;
  const _ActionButtons(this.isSignInMode);

  @override
  Widget build(BuildContext context) {
    var read = context.read<AuthFormCubit>();
    return Row(
      children: [
        Spacer(),
        TextButton(
          key: Key('toggle_auth_mode'),
          onPressed: read.toggleForm,
          child: Text(isSignInMode ? 'Register' : 'Sign In'),
        ),
        FilledButton(
          key: Key('sign_in-register'),
          onPressed: isSignInMode ? read.signIn : read.createAccount,
          child: Text(isSignInMode ? 'Sign In' : 'Register'),
        )
      ],
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<AuthFormCubit>();
    return TextFormField(
      key: Key('email'),
      initialValue: read.state.email,
      onChanged: read.updateEmail,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<AuthFormCubit>();
    return TextFormField(
      key: Key('password'),
      initialValue: read.state.password,
      onChanged: read.updatePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<AuthFormCubit>();
    return TextFormField(
      key: Key('confirm_password'),
      initialValue: read.state.confirmPassword,
      onChanged: read.updateConfirmPassword,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Enter your password again',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class OrganisationNameField extends StatelessWidget {
  const OrganisationNameField({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<AuthFormCubit>();
    return TextFormField(
      key: Key('organisationName'),
      initialValue: read.state.organisationName,
      onChanged: read.updateOrganisationName,
      decoration: InputDecoration(
        labelText: 'Organisation Name',
        hintText: 'Enter your organisation name',
        border: OutlineInputBorder(),
      ),
    );
  }
}
