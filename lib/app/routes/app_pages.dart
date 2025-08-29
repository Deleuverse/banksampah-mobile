import 'package:get/get.dart';

import '../modules/detail_sampah/bindings/detail_sampah_binding.dart';
import '../modules/detail_sampah/views/detail_sampah_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_user/bindings/home_user_binding.dart';
import '../modules/home_user/views/home_user_view_glasses.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeParticipantView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_USER,
      page: () => const TrashBankApp(),
      binding: HomeUserBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SAMPAH,
      page: () => const DetailSampahView(),
      binding: DetailSampahBinding(),
    ),
  ];
}
