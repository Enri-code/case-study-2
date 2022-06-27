import 'package:authentication_domain/src/models/app_error.dart';
import 'package:authentication_domain/src/models/user.dart';
import 'package:dartz/dartz.dart';

/// {@template authentication_domain}
/// The interface for an API that provides access to authentication.
/// {@endtemplate}
abstract class AuthenticationRepo {
  /// {@macro authentication_domain}
  const AuthenticationRepo();
  Future<Either<AppError, User>> login(
      {required String email, required String password});
  Future<Either<AppError, User>> signUp(
      {required String email, required String password});
}
