import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:authentication_use_case/usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

enum AuthStatus { waiting, loading, success, failed }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase repo;
  AuthBloc({required this.repo}) : super(AuthState.initial()) {
    on<_SignUp>(_onSignUp);
    on<_Login>(_onLogin);
    on<_GoogleSignIn>(_onGoogleSignIn);
  }
  Future _onSignUp(_SignUp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    Either<AppError, User> res =
        await repo.signUp(email: event.email, password: event.password);
    res.fold((l) => emit(state.copyWith(status: AuthStatus.failed, error: l)),
        (r) => emit(state.copyWith(status: AuthStatus.success)));
  }

  Future _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    Either<AppError, User> res = await repo.login(
      email: event.email,
      password: event.password,
    );
    res.fold(
        (l) => emit(state.copyWith(status: AuthStatus.failed, error: l)),
        (r) => emit(state.copyWith(
              status: AuthStatus.success,
            )));
  }

  Future _onGoogleSignIn(_GoogleSignIn event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    Either<AppError, User> res = await repo.googleSignIn(
      email: event.email,
      password: event.password,
    );
    res.fold(
        (l) => emit(state.copyWith(status: AuthStatus.failed, error: l)),
        (r) => emit(state.copyWith(
              status: AuthStatus.success,
            )));
  }
}
