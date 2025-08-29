import 'package:bank_sampah/app/modules/home/controllers/home_controller.dart';
import 'package:bank_sampah/app/modules/home_user/controllers/home_user_controller.dart';
import 'package:bank_sampah/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';


class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeParticipantController(), fenix: true);
    Get.lazyPut(() => HomeUserController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);

  }
}
