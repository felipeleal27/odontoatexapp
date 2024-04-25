// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bitebyte/app/core/rest_client/rest_client_response.dart';

class RestClienteException implements Exception {
  String? message;
  int? statusCode;
  dynamic error;
  RestClientResponse response;

  RestClienteException({
    this.message,
    this.statusCode,
    required this.error,
    required this.response,
  });

  @override
  String toString() {
    return 'RestClienteException(message: $message, statusCode: $statusCode, error: $error, response: $response)';
  }
}
