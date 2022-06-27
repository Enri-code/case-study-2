import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String errMessage;

  AppError({this.errMessage = 'Unknown Error.'});
  @override
  List<Object?> get props => [errMessage];
}
