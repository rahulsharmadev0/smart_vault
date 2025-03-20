import 'dart:async';
import 'package:dart_suite/dart_suite.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/repositories/authentication_repository.dart';

enum FormState {
  /// The form has not yet been submitted.
  initial,

  /// The form is in the process of being submitted.
  inProgress,

  /// The form has been submitted successfully.
  success,

  /// The form submission failed.
  failure,

  /// The form submission has been canceled.
  canceled,
}

class AuthFormState with EquatableMixin {
  final String organisationName;
  final String email;
  final String password;
  final String confirmPassword;
  final FormState formState;
  final String? errorMessage;
  final bool isSignInMode;

  const AuthFormState({
    required this.organisationName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.formState,
    required this.isSignInMode,
    this.errorMessage,
  });

  static AuthFormState initial = AuthFormState(
    organisationName: '',
    email: '',
    password: '',
    confirmPassword: '',
    formState: FormState.initial,
    isSignInMode: true,
  );

  AuthFormState copyWith({
    String? organisationName,
    String? email,
    String? password,
    String? confirmPassword,
    FormState? formState,
    String? msg,
    bool? isSignInMode,
  }) {
    return AuthFormState(
      organisationName: organisationName ?? this.organisationName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formState: formState ?? this.formState,
      errorMessage: msg,
      isSignInMode: isSignInMode ?? this.isSignInMode,
    );
  }

  @override
  List<Object?> get props => [
    organisationName,
    email,
    password,
    confirmPassword,
    formState,
    errorMessage,
    isSignInMode,
  ];

  bool get isValidSignIn => password.isNotBlank && email.regMatch(regPatterns.email);

  bool get isValidCreateAccount =>
      password.isNotBlank &&
      organisationName.regMatch(regPatterns.username()) &&
      email.regMatch(regPatterns.email) &&
      password == confirmPassword;

  AuthFormState toggleMode() =>
      copyWith(isSignInMode: !isSignInMode, msg: null, formState: FormState.initial);
}

class AuthFormCubit extends Cubit<AuthFormState> {
  AuthFormCubit() : super(AuthFormState.initial);

  Stream<bool> get authState => authRepo.isSignedIn;

  void createAccount() {
    if (state.isValidCreateAccount) {
      emit(state.copyWith(formState: FormState.inProgress));
      authRepo
          .signUp(state.organisationName, state.email, state.password)
          .then((_) => emit(state.copyWith(formState: FormState.success)))
          .catchError(
            (e) => emit(state.copyWith(formState: FormState.failure, msg: e.toString())),
          );
    }
  }

  void signIn() async {
    if (state.isValidSignIn) {
      emit(state.copyWith(formState: FormState.inProgress));
      authRepo
          .signIn(state.email, state.password)
          .then((_) => emit(state.copyWith(formState: FormState.success)))
          .catchError(
            (e) => emit(state.copyWith(formState: FormState.failure, msg: e.toString())),
          );
    }
  }

  void toggleForm() => emit(state.toggleMode());

  void onChangeOrganisationName(String organisationName) {
    emit(state.copyWith(organisationName: organisationName));
  }

  void onChangeEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void onChangePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void onChangeConfirmPassword(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }
}
