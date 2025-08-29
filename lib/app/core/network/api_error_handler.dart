import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../error/failure.dart';

class ApiErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is SocketException) {
      return Failure(code: 503, message: "No internet connection");
    } else if (error is TimeoutException) {
      return Failure(code: 408, message: "Request timeout");
    } else {
      return Failure(
          code: 500, message: "Something went wrong. Please try again later.");
    }
  }

  static Failure _handleDioError(DioException e) {
    final statusCode = e.response?.statusCode ?? 500;
    final responseData = e.response?.data;

    if (responseData is Map<String, dynamic>) {
      String errorMessage = responseData['message'] ??
          "Something went wrong. Please try again later.";

      if (responseData.containsKey('errors')) {
        final errors = responseData['errors'] as List;
        if (errors.isNotEmpty) {
          errorMessage = errors.first['message'];
        }
      }

      return Failure(code: statusCode, message: errorMessage);
    }

    return Failure(
        code: statusCode,
        message: "Something went wrong. Please try again later.");
  }
}
