part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStatus status,
    required AppError error,
  }) = _AuthState;
  factory AuthState.initial() =>
      AuthState(status: AuthStatus.waiting, error: AppError());
  // AuthState copyWith(AuthStatus? status, AppError? error){
  //   return AuthState(status: status?? this.status, error: error?? this.error);
  // }
}
