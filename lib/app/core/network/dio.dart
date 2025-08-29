import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


import '../../../main.dart';
import '../../network/interceptors/base_interceptor.dart';

class DioCore {
  late Dio dio;
  late Map<String, String> _defaultHeaders;

  DioCore() {
    dio = Dio();
    dio.options.baseUrl = "https://bank-sampah-bumiinspirasi-production.up.railway.app";
    dio.interceptors.addAll([
      BaseInterceptor(dio),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        request: true,
        responseBody: true,
        responseHeader: true,
      ),
    ]);
    _defaultHeaders = {
      'Connection': 'keep-alive',
    };
  }

  Future<Response> get({
    required String path,
    final dynamic queryParameters,
    final Map<String, String>? headers,
    String contentType = Headers.jsonContentType,
  }) async {
    final mergedHeaders = _mergeHeaders(headers);
    return await dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: mergedHeaders,
        contentType: contentType,
      ),
    );
  }

  Future<Response> post({
    required String path,
    final Object? data,
    final dynamic queryParameters,
    final Map<String, String>? headers,
    String contentType = Headers.jsonContentType,
  }) async {
    final mergedHeaders = _mergeHeaders(headers);
    return await dio.post(
      path,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        headers: mergedHeaders,
        contentType: contentType,
      ),
    );
  }

  Future<Response> patch({
    required String path,
    final dynamic queryParameters,
    final Map<String, String>? headers,
    String contentType = Headers.jsonContentType,
  }) async {
    final mergedHeaders = _mergeHeaders(headers);
    return await dio.patch(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: mergedHeaders,
        contentType: contentType,
      ),
    );
  }

  Future<Response> put({
    required String path,
    final Object? data,
    final dynamic queryParameters,
    final Map<String, String>? headers,
    String contentType = Headers.jsonContentType,
  }) async {
    final mergedHeaders = _mergeHeaders(headers);
    return await dio.put(
      path,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        headers: mergedHeaders,
        contentType: contentType,
      ),
    );
  }

  Future<Response> delete({
    required String path,
    final dynamic queryParameters,
    final Map<String, String>? headers,
    String contentType = Headers.jsonContentType,
  }) async {
    final mergedHeaders = _mergeHeaders(headers);
    return await dio.delete(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: mergedHeaders,
        contentType: contentType,
      ),
    );
  }

  Future<Response> download({
    required String path,
    required String savePath,
    final dynamic queryParameters,
    final Map<String, String>? headers,
    final Function(int, int)? onReceiveProgress,
    String contentType = Headers.jsonContentType,
  }) async {
    final mergedHeaders = _mergeHeaders(headers);
    return await dio.download(
      path,
      savePath,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
      options: Options(
        headers: mergedHeaders,
        contentType: contentType,
      ),
    );
  }

  Map<String, String> _mergeHeaders(Map<String, String>? headers) {
    final mergedHeaders = Map<String, String>.from(_defaultHeaders);
    if (headers != null) {
      mergedHeaders.addAll(headers);
    }
    return mergedHeaders;
  }
}
