import 'package:bank_sampah/app/configs/base/base_controller.dart';
import 'package:bank_sampah/app/core/response/pengumuman_response.dart';
import 'package:bank_sampah/app/core/response/sampah_response.dart';
import 'package:bank_sampah/app/network/user_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/response/user_response.dart';
import '../../../utils/preferences_helper.dart';

class HomeUserController extends BaseController {
  List<DataSampah> sampahList = <DataSampah>[].obs;
  List<Notif> notifList = <Notif>[].obs;
  final isLoading = true.obs;
  final isLoadingSampah = true.obs;
  UserDetailProvider userDetailProvider = UserDetailProvider();
  late UserResponse userResponse;
  final isLoadingNotif = true.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  final count = 0.obs;
  @override
  void onInit() {
    getDataUser();
    super.onInit();
  }

  getDataUser() async {
   userResponse= PreferencesHelper.getDataUser()!;
    getSampahList();
    getNotifList();

  }

  getSampahList() async {
    final response =
    await userDetailProvider.getSampah();
    response.fold(
          (failure) async {
        isLoadingSampah.value = false;
      },
          (data) async {
        sampahList = data.data;
        isLoadingSampah.value = false;
      },
    );
  }

  getNotifList() async {
    final response =
    await userDetailProvider.getNotif();
    response.fold(
          (failure) async {
        isLoadingNotif.value = false;
      },
          (data) async {
        notifList = data.data;
        isLoadingNotif.value = false;
      },
    );
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
