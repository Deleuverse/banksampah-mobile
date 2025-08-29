import 'package:bank_sampah/app/core/response/login_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';

import '../token_provider.dart';


class BaseInterceptor extends Interceptor {
  Dio dio;
  final TokenProvider _tokenProvider = TokenProvider();
  bool _isRefreshing = false;

  BaseInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {


    handler.next(options);
  }



}
