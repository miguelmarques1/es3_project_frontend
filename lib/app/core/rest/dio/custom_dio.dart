import 'package:dio/dio.dart';
import 'package:es3_proj/app/core/helpers/constants.dart';
import 'package:es3_proj/app/core/helpers/environments.dart';
import 'package:es3_proj/app/core/rest/rest_client.dart';
import 'package:es3_proj/app/core/rest/rest_client_exception.dart';
import 'package:es3_proj/app/core/rest/rest_client_response.dart';

class CustomDio implements RestClient {
  late final Dio _dio;

  final _defaultOptions = BaseOptions(
    baseUrl: Environments.param(Constants.ENV_BASE_URL_KEY) ?? '',
    connectTimeout: const Duration(milliseconds: 60000),
    receiveTimeout: const Duration(milliseconds: 60000),
  );

  CustomDio({
    BaseOptions? baseOptions,
  }) {
    _dio = Dio(baseOptions ?? _defaultOptions);
  }

  @override
  Future<RestClientResponse<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return RestClientResponse<T>.fromDio(response);
    } on DioException catch (e) {
      throw RestClientException.fromDioException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return RestClientResponse<T>.fromDio(response);
    } on DioException catch (e) {
      throw RestClientException.fromDioException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return RestClientResponse<T>.fromDio(response);
    } on DioException catch (e) {
      throw RestClientException.fromDioException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return RestClientResponse<T>.fromDio(response);
    } on DioException catch (e) {
      throw RestClientException.fromDioException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return RestClientResponse<T>.fromDio(response);
    } on DioException catch (e) {
      throw RestClientException.fromDioException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path,
      {required String method,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers, method: method),
      );
      return RestClientResponse<T>.fromDio(response);
    } on DioException catch (e) {
      throw RestClientException.fromDioException(e);
    }
  }
}
