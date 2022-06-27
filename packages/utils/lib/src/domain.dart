import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

abstract class ApiClient<T extends Response> {
  Future<T> post(String endpoint, {Map<String, dynamic>? body});

  Future<T> get(String endpoint);

  @mustCallSuper
  T throwIfNot(
      {required T response,
      required bool condition,
      required Exception error}) {
    if (!condition) {
      throw error;
    } else {
      return response;
    }
  }
}
