class NetworkException implements Exception {}

class ServerException implements Exception {
  int statusCode;
  String message;
  dynamic response;

  ServerException({
    required this.statusCode,
    required this.message,
    required this.response,
  });
}
