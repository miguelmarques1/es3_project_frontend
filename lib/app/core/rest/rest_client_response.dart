import 'package:dio/dio.dart';

class RestClientResponse<T> {
  T? data;
  int? statusCode;
  String? message;
  RestClientResponse({
    this.data,
    this.statusCode,
    this.message,
  });

  factory RestClientResponse.fromDio(Response<dynamic> response) {
    return RestClientResponse(
      data: response.data,
      message: response.statusMessage,
      statusCode: response.statusCode,
    );
  }
}
