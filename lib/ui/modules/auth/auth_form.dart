import 'package:bloc_suite/bloc_suite.dart';
import 'package:edukit/ui/modules/auth/auth_form_cubit.dart';
import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationForm extends BlocWidget<AuthFormCubit, AuthFormState> {
  const AuthenticationForm({super.key});

  @override
  Widget build(BuildContext context, bloc, state) {
    final isSignInMode = state.isSignInMode;
    return SizedBox(
      width: 600,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _AuthFormHeader(isSignInMode),
          const SizedBox(height: 24),
          if (!isSignInMode)
            _FormField(
              key: const Key('org_name'),
              label: 'Organization Name',
              hint: 'Enter your organization name',
              value: state.organisationName,
              onChanged: bloc.onChangeOrganisationName,
              validator:
                  (!isSignInMode && state.organisationName.isEmpty)
                      ? 'Organization name is required'
                      : null,
            ),

          _FormField(
            key: const Key('email'),
            label: 'Email',
            hint: 'Enter your email',
            value: state.email,
            onChanged: bloc.onChangeEmail,
            validator: state.email.isEmpty ? 'Email is required' : null,
          ),

          _FormField(
            key: const Key('password'),
            label: 'Password',
            hint: 'Enter your password',
            value: state.password,
            onChanged: bloc.onChangePassword,

            isPassword: true,
            validator: state.password.isEmpty ? 'Password is required' : null,
          ),

          if (!isSignInMode)
            _FormField(
              key: const Key('confirm_password'),
              label: 'Confirm Password',
              hint: 'Enter your password again',
              value: state.confirmPassword,
              onChanged: bloc.onChangeConfirmPassword,
              isPassword: true,
              validator:
                  (!isSignInMode && state.password != state.confirmPassword)
                      ? 'Passwords do not match'
                      : null,
            ),

          if (state.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                state.errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
                textAlign: TextAlign.center,
              ),
            ),

          const SizedBox(height: 24),

          _ActionButtons(),
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
      TextSpan(
        children: [
          TextSpan(text: isSignInMode ? 'Sign in to ' : 'Register to '),
          TextSpan(text: 'Edukit', style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      style: const TextStyle(fontSize: 24),
      textAlign: TextAlign.center,
    );
  }
}

class _FormField extends StatelessWidget {
  final String label;
  final String hint;
  final String value;

  final bool isPassword;
  final String? validator;
  final ValueChanged<String> onChanged;

  const _FormField({
    required this.label,
    required this.hint,
    required this.value,
    required this.onChanged,
    this.isPassword = false,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        key: key,
        initialValue: value,
        onChanged: onChanged,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          errorText: validator,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class _ActionButtons extends BlocWidget<AuthFormCubit, AuthFormState> {
  @override
  Widget build(BuildContext context, bloc, state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          key: const Key('toggle_auth_mode'),
          onPressed: bloc.toggleForm,
          child: Text(state.isSignInMode ? 'Create account' : 'Sign In'),
        ),
        const SizedBox(width: 12),
        FilledButton(
          key: const Key('sign_in-register'),
          onPressed:
              state.isSignInMode
                  ? (state.isValidSignIn ? bloc.signIn : null)
                  : (state.isValidCreateAccount ? bloc.createAccount : null),
          child: Text(state.isSignInMode ? 'Sign In' : 'Register'),
        ),
      ],
    );
  }
}
