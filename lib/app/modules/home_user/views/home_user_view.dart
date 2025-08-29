import 'dart:ui';

import 'package:bank_sampah/app/configs/base/base_view.dart';
import 'package:bank_sampah/app/configs/resources/size%20copy.dart';
import 'package:bank_sampah/app/core/widgets/custom_outline_button.dart';
import 'package:bank_sampah/app/core/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../configs/resources/color.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_user_controller.dart';

class HomeUserView extends BaseView<HomeUserController> {
  const HomeUserView({super.key});

  @override
  GlobalKey<ScaffoldState>? scaffoldKey() => controller.scaffoldKey;

  @override
  bool safeArea() => false;

  @override
  bool? extendBody() => true;

  @override
  PreferredSizeWidget? appBar(context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: SizeConfig.s60.h,
      title: profile(context),
      actions: [
        SizedBox(width: SizeConfig.s10.w),
        GestureDetector(
            onTap: () {}, child: SvgPicture.asset(Assets.icons.icNotification)),
        SizedBox(width: SizeConfig.s10.w),
        InkWell(
          onTap: () => controller.scaffoldKey.currentState!.openEndDrawer(),
          child: Icon(Icons.menu),
        ),
        SizedBox(width: SizeConfig.s20.w),
      ],
    );
  }

  @override
  Widget? endDrawer() {
    return Drawer(
      backgroundColor: Colors.white.withOpacity(0.95),
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(SizeConfig.s24.r)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.s20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.icRalla,
                      colorFilter: const ColorFilter.mode(ColorConfig.redOrange, BlendMode.srcIn),
                      width: SizeConfig.s77.w,
                      height: SizeConfig.s30.h,
                    ),
                    SizedBox(height: SizeConfig.s20.h),
                    CustomText(
                      text: controller.isLoading.value ? "" : controller.userResponse.namaLengkap,
                      color: ColorConfig.black,
                      fontSize: SizeConfig.s18.sp,
                      fontWeight: FontWeight.w700,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // ... rest of drawer items with glass effect
            ],
          ),
        ),
      ),
    );
  }

  Widget profile(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: SizeConfig.s55.h,
        maxWidth: SizeConfig.s190.w,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.s08.w,
          vertical: SizeConfig.s08.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(SizeConfig.s26.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.2),
              Colors.white.withOpacity(0.1),
            ],
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: controller.userResponse.foto != ""
                  ? CachedNetworkImage(
                imageUrl: controller.userResponse.foto,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: SizeConfig.s30.w,
                height: SizeConfig.s30.h,
              )
                  : Container(
                color: Colors.grey,
                child: Icon(Icons.person, size: SizeConfig.s30.r),
              ),
            ),
            SizedBox(width: SizeConfig.s10.w),
            Expanded(
              child: CustomText(
                text: controller.userResponse.namaLengkap,
                color: ColorConfig.black,
                fontSize: SizeConfig.s14.sp,
                fontWeight: FontWeight.w700,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, size: SizeConfig.s20.r),
          ],
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorConfig.colorBody,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.s20.w, vertical: SizeConfig.s20.h),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(SizeConfig.s20.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(SizeConfig.s24.r),
                border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.1),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          CustomText(
                            text: 'Saldo Kamu',
                            fontSize: SizeConfig.s20.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConfig.green,
                          ),
                          CustomText(
                            text: 'Rp. 1.000.000',
                            fontSize: SizeConfig.s16.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorConfig.green,
                          ),
                        ],
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        Assets.images.imageBackgroundHome,
                        width: SizeConfig.s100.w,
                        height: SizeConfig.s100.h,
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.s20.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomOutlineButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(SizeConfig.s100.r),
                          ),
                          backgroundColor: ColorConfig.green.withOpacity(0.9),
                          colorBorder: ColorConfig.green,
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.s10.w,
                            vertical: SizeConfig.s05.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: 'Tarik Saldo',
                                fontSize: SizeConfig.s14.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorConfig.white,
                              ),
                              SizedBox(width: SizeConfig.s10.w),
                              Icon(Icons.attach_money, color: ColorConfig.white),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.s10.w),
                      Expanded(
                        child: CustomOutlineButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(SizeConfig.s100.r),
                          ),
                          backgroundColor: ColorConfig.green.withOpacity(0.9),
                          colorBorder: ColorConfig.green,
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.s10.w,
                            vertical: SizeConfig.s05.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: 'Riwayat',
                                fontSize: SizeConfig.s14.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorConfig.white,
                              ),
                              SizedBox(width: SizeConfig.s10.w),
                              Icon(Icons.history, color: ColorConfig.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

            ),
            SizedBox(height: SizeConfig.s20.h),
            Theme(
                data:
                Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: CustomText(
                    text: "Jenis Sampah",
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.s18.sp,
                  ),
                  subtitle:CustomText(
                    text: "Kenali berbagai jenis sampah yang dapat didaur ulang",
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.s14.sp,
                    color: ColorConfig.textColor,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    controller.isLoadingSampah.value?Center(
                      child: SizedBox(
                        height: SizeConfig.s50.h,
                        width: SizeConfig.s50.w,
                        child: CircularProgressIndicator(
                          color: ColorConfig.green,
                        ),
                      ),
                    ):Container(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.s20.w,vertical: SizeConfig.s10.h),
                      height: SizeConfig.s300.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_SAMPAH, arguments: controller.sampahList[0]);
                            },
                            child: Container(
                              width: SizeConfig.s250.w,

                              margin: EdgeInsets.only(right: SizeConfig.s20.w),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: SizeConfig.s50.w,
                                    child: Container(
                                      width: SizeConfig.s200.w,
                                      height: SizeConfig.s300.h,

                                      margin: EdgeInsets.only(right: SizeConfig.s10.w),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(SizeConfig.s100.r),
                                            topRight: Radius.circular(SizeConfig.s20.r),
                                            bottomLeft: Radius.circular(SizeConfig.s20.r),bottomRight: Radius.circular(SizeConfig.s20.r)),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      left: SizeConfig.s60.w,
                                      bottom: SizeConfig.s80.h,
                                      child: SizedBox(


                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(width: SizeConfig.s10.w),
                                            CustomText(
                                              text:  "PLastik",
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeConfig.s14.sp,
                                            ),
                                            SizedBox(height: SizeConfig.s05.h),
                                            CustomText(
                                              text:  "Rp. 10.000",
                                              fontWeight: FontWeight.bold,
                                              fontSize: SizeConfig.s16.sp,
                                              color: ColorConfig.black,
                                            ),
                                          ],
                                        ),
                                      )),
                                  Hero(
                                    tag: "image_sampah",
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(SizeConfig.s150.r),
                                      child: CachedNetworkImage(
                                        imageUrl: "https://moaja.id/wp-content/uploads/2024/02/Bagaimana-Plastik-Berpengaruh-Pada-Perubahan-Iklim.jpg",
                                        fit: BoxFit.cover,
                                        height: SizeConfig.s150.h,
                                        width: SizeConfig.s150.w,

                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),


                  ],

                )
            ),
            SizedBox(height: SizeConfig.s20.h),
            Theme(
                data:
                Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: CustomText(
                    text: "Pengumuman",
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.s18.sp,
                  ),
                  subtitle:CustomText(
                    text: "Informasi penting dan pengumuman terbaru dari bank sampah",
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.s14.sp,
                    color: ColorConfig.textColor,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    controller.isLoadingNotif.value?Center(
                      child: SizedBox(
                        height: SizeConfig.s50.h,
                        width: SizeConfig.s50.w,
                        child: CircularProgressIndicator(
                          color: ColorConfig.green,
                        ),
                      ),
                    ):Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.s20.w),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.notifList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: SizeConfig.s10.h),
                            padding: EdgeInsets.all(SizeConfig.s10.w),
                            decoration: BoxDecoration(
                              color: ColorConfig.white,
                              borderRadius: BorderRadius.circular(SizeConfig.s10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.notifications_active, color: ColorConfig.green, size: SizeConfig.s30.sp),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: SizeConfig.s10.w),
                                      CustomText(
                                        text:  controller.notifList[index].judul,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeConfig.s14.sp,
                                      ),
                                      SizedBox(height: SizeConfig.s05.h),
                                      CustomText(
                                        text:  controller.notifList[index].isi,
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.s16.sp,
                                        color: ColorConfig.black,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),


                  ],

                )
            ),
          ],
        ),
      ),
    );
  }
}

