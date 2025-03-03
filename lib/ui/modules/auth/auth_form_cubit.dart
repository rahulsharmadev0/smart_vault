import 'package:dart_suite/dart_suite.dart';
import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  static AuthFormState empty = AuthFormState(
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
    String? errorMessage,
    bool? isSignInMode,
  }) {
    return AuthFormState(
      organisationName: organisationName ?? this.organisationName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formState: formState ?? this.formState,
      errorMessage: errorMessage,
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
}

extension on AuthFormState {
  // AuthFormState inProgress() => copyWith(formState: FormState.inProgress);

  // AuthFormState success() => copyWith(formState: FormState.success);

  // AuthFormState failure(String errorMessage) =>
  //     copyWith(formState: FormState.failure, errorMessage: errorMessage);

  bool isValidSignIn() => password.isNotEmpty && email.regMatch(regPatterns.email);

  bool isValidCreateAccount() =>
      password.isNotBlank &&
      organisationName.regMatch(regPatterns.username()) &&
      email.regMatch(regPatterns.email) &&
      password == confirmPassword;

  AuthFormState toggleMode() => copyWith(isSignInMode: !isSignInMode);
}

// ---

class AuthFormCubit extends Cubit<AuthFormState> {
  final AuthCubit bloc;
  AuthFormCubit({required this.bloc}) : super(AuthFormState.empty);

  void createAccount() {
    if (state.isValidCreateAccount()) {
      bloc.registerWithEmailAndPassword(
        email: state.email,
        password: state.password,
        name: state.organisationName,
      );
    }
  }

  void signIn() async {
    if (state.isValidSignIn()) {
      bloc.signInWithEmailAndPassword(email: state.email, password: state.password);
    }
  }

  void toggleForm() => emit(state.toggleMode());

  void updateOrganisationName(String organisationName) {
    emit(state.copyWith(organisationName: organisationName));
  }

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void updateConfirmPassword(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }
}
