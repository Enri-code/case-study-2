import 'package:authentication_infrastruture/src/helpers/server_address.dart';

String get relevant => const ServerAddress().relevant;

class Endpoints {
  static _Auth get auth => _Auth();
}

class _Auth {
  String get signUp => relevant + 'register';
  String get login => relevant + 'login';
}
