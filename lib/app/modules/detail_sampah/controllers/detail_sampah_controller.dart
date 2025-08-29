import 'package:bank_sampah/app/configs/base/base_controller.dart';
import 'package:bank_sampah/app/core/response/sampah_response.dart';
import 'package:get/get.dart';

class DetailSampahController extends BaseController {
  //TODO: Implement DetailSampahController

  final count = 0.obs;
  late DataSampah sampah;

  @override
  void onInit() {
    sampah = Get.arguments;

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
