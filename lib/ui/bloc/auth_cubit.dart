import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

part 'auth_cubit.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  const factory AuthState.error(String errorMessage) = AuthStateError;
  const factory AuthState.authenticated(String email, String name, String uid) = AuthStateAuthenticated;
  const factory AuthState.newAccountCreated(String email, String name, String uid) =
      AuthStateNewAccountCreated;
}

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository _authRepo;

  bool get isAuthenticated => state is AuthStateAuthenticated || state is AuthStateNewAccountCreated;
  bool get isUnauthenticated => state is AuthStateUnauthenticated;

  AuthCubit({required AuthenticationRepository repo})
    : _authRepo = repo,

      super(const AuthState.unauthenticated()) {
    _userSubscription = _authRepo.user.listen(_handleUserChange, onError: _handleError);
  }

  void registerWithEmailAndPassword({required String email, required String password, required String name}) {
    _authRepo.registerWithEmailAndPassword(email: email, password: password, displayName: name).then((cred) {
      var user = cred.user!;
      emit(AuthState.newAccountCreated(user.email!, user.displayName!, user.uid));
    }, onError: _handleError);
  }

  void signInWithEmailAndPassword({required String email, required String password}) {
    _authRepo.signInWithEmailAndPassword(email: email, password: password).then((cred) {
      var user = cred.user!;
      emit(AuthState.authenticated(user.email!, user.displayName!, user.uid));
    }, onError: _handleError);
  }

  StreamSubscription<fbAuth.User?>? _userSubscription;

  void _handleUserChange(fbAuth.User? user) {
    if (user == null) {
      emit(const AuthState.unauthenticated());
    } else {
      emit(AuthState.authenticated(user.email!, user.displayName!, user.uid));
    }
  }

  Future<void> signOut() {
    return _authRepo.signOut().then((_) {
      emit(const AuthState.unauthenticated());
    }, onError: _handleError);
  }

  @override
  Future<void> close() async {
    await _userSubscription?.cancel();
    return super.close();
  }

  void _handleError(dynamic error) {
    emit(AuthState.error(error.toString()));
  }
}
