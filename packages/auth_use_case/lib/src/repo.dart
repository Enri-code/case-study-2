import 'package:authentication_domain/domain.dart';
import 'package:dartz/dartz.dart';

class AuthUseCase {
  const AuthUseCase({required AuthenticationRepo repo}) : _repo = repo;
  final AuthenticationRepo _repo;

  Future<Either<AppError, User>> login(
          {required String email, required String password}) =>
      _repo.login(email: email, password: password);

  Future<Either<AppError, User>> signUp({
    required String email,
    required String password,
  }) =>
      _repo.signUp(
        email: email,
        password: password,
      );
  Future<Either<AppError, User>> googleSignIn(
          {required String email, required String password}) =>
      _repo.login(email: email, password: password);
}
