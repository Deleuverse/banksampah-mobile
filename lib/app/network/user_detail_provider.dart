import 'package:bank_sampah/app/core/response/pengumuman_response.dart';
import 'package:bank_sampah/app/core/response/sampah_response.dart';
import 'package:bank_sampah/app/core/response/user_response.dart';
import 'package:dartz/dartz.dart';

import '../core/network/api_error_handler.dart';
import '../core/network/dio.dart';
import '../error/failure.dart';


class UserDetailProvider extends DioCore {
  /// **User Detail**
  Future<Either<Failure, UserResponse>> getCurrentUserInfo(
      String token) async {
    try {
      final response = await get(
        path: '/api/nasabah/profile',
        headers: {
          'Authorization': 'Bearer $token',
        },

      );

      final userResponse = UserResponse.fromJson(response.data);
      print(response.data);
      return right(userResponse);
    } catch (e) {
      print(e);
      return left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<Failure, SampahResponse>> getSampah() async {
    try {
      final response = await get(
        path: '/api/sampah',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      final userResponse = SampahResponse.fromJson(response.data);
      print(response.data);
      return right(userResponse);
    } catch (e) {
      print(e);
      return left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<Failure, PengumumanResponse>> getNotif() async {
    try {
      final response = await get(
        path: '/api/pengumuman',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      final userResponse = PengumumanResponse.fromJson(response.data);
      print(response.data);
      return right(userResponse);
    } catch (e) {
      print(e);
      return left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<Failure, UserResponse>> login(String noInduk,String Password) async {
    try {
      final response = await post(
        path: '/api/nasabah/login',
        data: {
          'nomer_induk_nasabah': noInduk,
          'password': Password,
        },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      final userResponse = UserResponse.fromJson(response.data['nasabah']);
      print(response.data);
      return right(userResponse);
    } catch (e) {
      print(e);
      return left(ApiErrorHandler.handle(e));
    }
  }
}
