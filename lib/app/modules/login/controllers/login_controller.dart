import 'dart:convert';

import 'package:bank_sampah/app/core/response/user_response.dart';
import 'package:bank_sampah/app/network/user_detail_provider.dart';
import 'package:bank_sampah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/base/base_controller.dart';
import '../../../configs/resources/color.dart';
import '../../../network/token_provider.dart';
import '../../../utils/preferences_helper.dart';

class LoginController extends BaseController {
  final UserDetailProvider _authProvider = UserDetailProvider();
  final TokenProvider _tokenProvider = TokenProvider();
  final count = 0.obs;

  // Form key for validation
  final formKey = GlobalKey<FormState>();
  final isFirstLogin = false.obs;

  // TextEditingController
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isObscureText = true.obs;
  final textForgotPassColor = ColorConfig.redOrange.obs;
  final textSignUpColor = ColorConfig.redOrange.obs;
  final isRememberMe = false.obs;

  final isValidForm = false.obs;
  final isLoadingRalla = false.obs;
  final isLoadingGoogle = false.obs;
  final isLoadingApple = false.obs;
  final isLoadingFacebook = false.obs;

  void toggleObscureText() {
    isObscureText.value = !isObscureText.value;
  }

  // Email validator
  String? validateEmail(String email) {
    // Basic email regex validation
    if (email.isEmpty) {
      return "Email is required.";
    }
    return null;
  }

  // Password validator
  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Password is required.";
    } else if (password.length < 8) {
      return "Password must contain at least 8 characters.";
    }
    return null;
  }


  Future<void> login() async {
    isLoadingRalla.value = true;
    await _tokenProvider.clearToken();

    var result = await _authProvider.login(
        emailController.value.text, passwordController.value.text);
    result.fold(
          (failure) {
        if (isClosed) return;
        final errorMessage = failure.message ??
            "An error occurred during authentication. Please try again.";
        Get.snackbar("Authentication Failed", errorMessage);
        isLoadingRalla.value = false;
        // Get.offAllNamed(Routes.HOME);
      },
          (data) async {
        if (isClosed) return;
        PreferencesHelper().saveDataUser(
            UserResponse.fromJson(jsonDecode(jsonEncode(data.toJson()))));
        PreferencesHelper().saveIsFirstLogin(true);
        Get.offAllNamed(Routes.HOME);
      },
    );
  }



  void validateForm() {
    final emailValid = validateEmail(emailController.text) == null;
    final passwordValid = validatePassword(passwordController.text) == null;

    isValidForm.value = emailValid && passwordValid;
  }

  @override
  void onInit() {
    isFirstLogin.value = PreferencesHelper.getIsFirstLogin();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
