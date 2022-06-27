import 'package:meta/meta.dart';

@immutable
class AppException implements Exception {
  final int? code;
  final String? err;

  const AppException({this.code, this.err});
}
