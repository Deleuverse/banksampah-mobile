import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

import '../../error/failure.dart';

class AuthErrorHandler {
  static Failure handle(dynamic error) {
    if (error is PlatformException && error.code == "CANCELED") {
      return Failure(code: 400, message: "Login was canceled by the user.");
    } else if (error is SocketException) {
      return Failure(code: 503, message: "No internet connection");
    } else if (error is TimeoutException) {
      return Failure(code: 408, message: "Request timeout");
    } else {
      return Failure(
          code: 500, message: "Authentication failed. Please try again.");
    }
  }
}
