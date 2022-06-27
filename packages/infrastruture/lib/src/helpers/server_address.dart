class ServerAddress {
  const ServerAddress();
  static const String _address = 'https://reqres.in';
  static const String _type = 'api';
  String get relevant => "$_address/$_type/";
}
