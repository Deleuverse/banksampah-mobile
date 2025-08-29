import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';

import '../../../../gen/assets.gen.dart';
import '../../../configs/base/base_view.dart';
import '../../../configs/resources/color.dart';
import '../../../configs/resources/size copy.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../utils/preferences_helper.dart';
import '../controllers/home_controller.dart';

class HomeParticipantView extends BaseView<HomeParticipantController> {
  const HomeParticipantView({Key? key}) : super(key: key);

  @override
  bool safeArea() {
    // TODO: implement safeArea
    return false;
  }

  @override
  bool? extendBody() {
    // TODO: implement extendBody
    return true;
  }

  @override
  Color? backgroundColor(context) {
    // TODO: implement backgroundColor
    return ColorConfig.colorBody;
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.tabController,
          children: controller.page,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: SizeConfig.s65.h,
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.s15.h, vertical: SizeConfig.s30.h),
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.s15.w, vertical: SizeConfig.s05.h),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorConfig.white,
              borderRadius: BorderRadius.circular(SizeConfig.s50.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                GestureDetector(
                  onTap: () {

                    controller.currentPage.value = 0;
                    controller.changePage(0);

                  },
                  child: SizedBox(
                    width: SizeConfig.s65.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home,
                          size: SizeConfig.s27.w,
                          color: controller.currentPage.value == 0
                              ? ColorConfig.green
                              : ColorConfig.textColor,
                        ),
                        CustomText(
                          text: 'Home',
                          textAlign: TextAlign.center,
                          fontWeight: controller.currentPage.value == 0
                              ? FontWeight.w700
                              : FontWeight.w500,
                          fontSize: SizeConfig.s10.sp,
                          color: controller.currentPage.value == 0
                              ? ColorConfig.green
                              : ColorConfig.textColor,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: SizeConfig.s65.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Icon(
                        Icons.notes,
                        size: SizeConfig.s27.w,
                        color: controller.currentPage.value == 1
                            ? ColorConfig.green
                            : ColorConfig.textColor,
                      ),
                      CustomText(
                        text: 'Riwayat',
                        textAlign: TextAlign.center,
                        fontWeight: controller.currentPage.value == 3
                            ? FontWeight.w700
                            : FontWeight.w500,
                        fontSize: SizeConfig.s10.sp,
                        color: controller.currentPage.value == 3
                            ? ColorConfig.green
                            : ColorConfig.textColor,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {

                    controller.changePage(2);
                    controller.currentPage.value = 2;
                  },
                  child: SizedBox(
                    width: SizeConfig.s65.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: SizeConfig.s27.w,
                          color: controller.currentPage.value == 2
                              ? ColorConfig.green
                              : ColorConfig.textColor,
                        ),
                        CustomText(
                          text: 'Profile',
                          textAlign: TextAlign.center,
                          fontWeight: controller.currentPage.value == 2
                              ? FontWeight.w700
                              : FontWeight.w500,
                          fontSize: SizeConfig.s10.sp,
                          color: controller.currentPage.value == 2
                              ? ColorConfig.green
                              : ColorConfig.textColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomClipperImage extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(2 * size.width / 3, 0.0);
    var firstEnd = Offset(size.width / 2, size.height / 2);
    path.arcToPoint(Offset(size.width / 3, 0), radius: Radius.circular(1));

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
