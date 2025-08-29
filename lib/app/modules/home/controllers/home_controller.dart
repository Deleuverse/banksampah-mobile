import 'dart:ui';

import 'package:bank_sampah/app/core/response/user_response.dart';
import 'package:bank_sampah/app/modules/home/views/home_view.dart';
import 'package:bank_sampah/app/modules/home_user/views/home_user_view.dart';
import 'package:bank_sampah/app/modules/home_user/views/home_user_view_glasses.dart';
import 'package:bank_sampah/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import '../../../configs/base/base_controller.dart';
import '../../../configs/resources/color.dart';
import '../../../network/token_provider.dart';
import '../../../utils/preferences_helper.dart';
import '../../../../gen/assets.gen.dart';
import '../../../configs/resources/color.dart';
import '../../../configs/resources/size copy.dart';
import '../../../core/widgets/custom_outline_button.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../routes/app_pages.dart';

class HomeParticipantController extends BaseController with GetSingleTickerProviderStateMixin {
  final currentPage = 0.obs;
  late TabController tabController;
  final isLoading =true.obs;


  final List<Widget> page = [
    HomeUserView(),
    SizedBox(),
    ProfileView(),
  ];
  @override
  void onInit() {
    tabController = TabController(length: page.length, vsync: this);

    // checkLocationPermission();
    super.onInit();
  }



  changePage(int newPage) {
    tabController.animateTo(newPage);
    currentPage.value = newPage;
  }

  @override
  void onReady() {
    super.onReady();
  }



  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onResume() {
    super.onResume();
    print('onResume');
  }

  @override
  void onPause() {
    super.onPause();
    print('onPause');
  }


}
