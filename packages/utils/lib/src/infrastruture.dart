import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:utils/src/domain.dart';
import 'package:utils/src/exceptions.dart';

class DioClient extends ApiClient<Response> {
  final Dio _dio = Dio();
  @override
  Future<Response> get(
    String endpoint,
  ) async {
    Response response = await _dio.get(endpoint);
    return responseOrError(response);
  }

  @override
  Future<Response> post(String endpoint, {Map<String, dynamic>? body}) async {
    Response response = await _dio.post(endpoint, data: body);
    print(response.data.toString());

    return responseOrError(response);
  }

  Response responseOrError(Response response) {
    return throwIfNot(
        response: response,
        condition: (response.statusCode == 200),
        error: AppException(
            code: response.statusCode, err: response.statusMessage));
  }
}
