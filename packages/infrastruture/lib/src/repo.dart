import 'dart:developer';

import 'package:authentication_domain/domain.dart';
import 'package:authentication_infrastruture/src/helpers/endpoints.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:utils/utils.dart';

class AuthenticationRepoImpl extends AuthenticationRepo {
  final ApiClient _apiClient;

  AuthenticationRepoImpl(this._apiClient);

  @override
  Future<Either<AppError, User>> login(
      {required String email, required String password}) async {
    try {
      Response res = await _apiClient.post(Endpoints.auth.login,
          body: {'email': 'eve.holt@reqres.in', 'password': 'pistol'});
      return Right(User.fromJson(res.data));
    } catch (e) {
      return Left(AppError());
    }
  }

  @override
  Future<Either<AppError, User>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      Response res = await _apiClient.post(Endpoints.auth.signUp,
          body: {'email': 'eve.holt@reqres.in', 'password': 'pistol'});
      return Right(User.fromJson(res.data));
    } catch (e) {
      return Left(AppError());
    }
  }
}
