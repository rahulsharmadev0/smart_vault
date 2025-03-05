import 'dart:async';
import 'package:repositories/repositories.dart';
import 'package:edukit/ui/bloc/organization_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

enum AuthStatus { authenticated, unauthenticated, error }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? errorMessage;

  const AuthState({required this.status, this.errorMessage});

  const AuthState.unauthenticated() : status = AuthStatus.unauthenticated, errorMessage = null;

  const AuthState.authenticated() : status = AuthStatus.authenticated, errorMessage = null;

  const AuthState.error(this.errorMessage) : status = AuthStatus.error;

  @override
  List<Object?> get props => [status, errorMessage];
}

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository _authRepo;
  final OrganizationBloc _orgBloc;

  bool get isAuthenticated => state.status == AuthStatus.authenticated;
  bool get isUnauthenticated => state.status == AuthStatus.unauthenticated;
  bool get hasError => state.status == AuthStatus.error;

  AuthCubit({required AuthenticationRepository repo, required OrganizationBloc bloc})
    : _authRepo = repo,
      _orgBloc = bloc,
      super(const AuthState.unauthenticated()) {
    _userSubscription = _authRepo.user.listen(_handleUserChange, onError: _handleError);
  }

  void registerWithEmailAndPassword({required String email, required String password, required String name}) {
    _authRepo.registerWithEmailAndPassword(email: email, password: password, displayName: name).then((cred) {
      _orgBloc.add(OrganizationEvent.create(email, name, cred.user!.uid));
      emit(const AuthState.authenticated());
    }, onError: _handleError);
  }

  void signInWithEmailAndPassword({required String email, required String password}) {
    _authRepo.signInWithEmailAndPassword(email: email, password: password).then((_) {
      emit(const AuthState.authenticated());
    }, onError: _handleError);
  }

  StreamSubscription<fbAuth.User?>? _userSubscription;

  void _handleUserChange(fbAuth.User? user) {
    if (user == null) {
      emit(const AuthState.unauthenticated());
    } else {
      _orgBloc.add(LoadOrganization(user.uid));
      emit(const AuthState.authenticated());
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
