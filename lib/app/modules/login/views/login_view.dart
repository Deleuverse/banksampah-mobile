import 'package:bank_sampah/app/configs/base/base_view.dart';
import 'package:bank_sampah/app/configs/resources/color.dart';
import 'package:bank_sampah/app/configs/resources/size%20copy.dart';
import 'package:bank_sampah/app/core/widgets/custom_outline_button.dart';
import 'package:bank_sampah/app/core/widgets/custom_text.dart';
import 'package:bank_sampah/app/core/widgets/custom_textfield.dart';
import 'package:bank_sampah/app/core/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/login_controller.dart';

class LoginView extends BaseView<LoginController> {
  const LoginView({super.key});

  @override
  Widget body(BuildContext context) {
    // TODO: implement body
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.s20.w,vertical: SizeConfig.s20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(Assets.images.imageBackgroundLogin,
                  width: SizeConfig.s300.w,
                  height: SizeConfig.s300.h,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Bank Sampah',
                  fontSize: SizeConfig.s36.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConfig.green,
                ),
              ),
              SizedBox(height: SizeConfig.s20.h),
              CustomTextFormField(
                labelText: "No Induk",
                textFieldController: controller.emailController,
                hintText: 'Masukkan No Induk',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor Induk tidak boleh kosong';
                  }
                  return null;
                },
                onChanged: (_) {
                  controller.validateForm();
                },
              ),
              SizedBox(height: SizeConfig.s20.h),
          
              CustomTextFormField(
                obscureText: controller.isObscureText.value,
                labelText: 'Password',
                hintText: 'Masukkan Password',
                textFieldController: controller.passwordController,
                validator: (password) {
                  return controller.validatePassword(password ?? '');
                },
                onChanged: (_) {
                  controller.validateForm();
                },
                suffixIcon: IconButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.s12.w, vertical: SizeConfig.s12.h),
                  icon: Icon(
                    controller.isObscureText.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: ColorConfig.eyeGreyColor,
                  ),
                  onPressed: () {
                    controller.toggleObscureText();
                  },
                ),
              ),
              SizedBox(height: SizeConfig.s20.h),
              SizedBox(
                width: double.infinity,
                height: SizeConfig.s50.h,
                child: CustomOutlineButton(
                  child: CustomText(
                    text: 'Masuk',
                    fontSize: SizeConfig.s16.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorConfig.white,
                  ),
                  onPressed: () {
                    if(!controller.isValidForm.value) {
                      Get.snackbar(
                        "Error",
                        "Please fill in all fields correctly.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: ColorConfig.redOrange,
                        colorText: ColorConfig.white,
                      );
                      return;
                    }else{
                      controller.login();
                    }
                  },
                  backgroundColor: !controller.isValidForm.value?ColorConfig.disableButtonColor:ColorConfig.green,
                  colorBorder: !controller.isValidForm.value?ColorConfig.disableButtonColor:ColorConfig.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  

}
