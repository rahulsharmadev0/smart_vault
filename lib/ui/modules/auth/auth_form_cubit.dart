import 'dart:async';
import 'package:dart_suite/dart_suite.dart';
import 'package:edukit/ui/utils/form_submission_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/models/organization.dart';
import 'package:repositories/repositories.dart';

class AuthFormState with EquatableMixin {
  final String organisationName;
  final String email;
  final String password;
  final String confirmPassword;
  final FormSubmissionStatus formState;
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
    formState: FormSubmissionStatus.initial,
    isSignInMode: true,
  );

  AuthFormState copyWith({
    String? organisationName,
    String? email,
    String? password,
    String? confirmPassword,
    FormSubmissionStatus? formState,
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

  AuthFormState toggleMode() => copyWith(
    isSignInMode: !isSignInMode,
    msg: null,
    formState: FormSubmissionStatus.initial,
  );
}

class AuthFormCubit extends Cubit<AuthFormState> {
  AuthFormCubit() : super(AuthFormState.initial);

  Stream<bool> get authState => authRepo.isSignedIn;

  Future<void> createAccount() async {
    if (!state.isValidCreateAccount) return;

    emit(state.copyWith(formState: FormSubmissionStatus.inProgress));

    try {
      await authRepo.signUp(state.email, state.password, state.organisationName);

      final organization = Organization(
        orgId: authRepo.currentUser!.uid,
        name: state.organisationName,
        email: state.email,
      );

      await orgRepo.create(organization);

      emit(state.copyWith(formState: FormSubmissionStatus.success));
    } catch (e) {
      emit(state.copyWith(formState: FormSubmissionStatus.failure, msg: e.toString()));
    }
  }

  void signIn() async {
    if (state.isValidSignIn) {
      emit(state.copyWith(formState: FormSubmissionStatus.inProgress));
      authRepo
          .signIn(state.email, state.password)
          .then((_) => emit(state.copyWith(formState: FormSubmissionStatus.success)))
          .catchError(
            (e) => emit(
              state.copyWith(formState: FormSubmissionStatus.failure, msg: e.toString()),
            ),
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
