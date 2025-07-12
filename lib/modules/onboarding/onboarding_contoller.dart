import 'package:get/get.dart';
import '../../app/app_routes.dart';

class OnboardingController extends GetxController {
  RxInt currentIndex = 0.obs;

  void nextPage() {
    if (currentIndex.value < 1) {
      currentIndex.value++;
    } else {
      Get.offAllNamed(AppRoutes.signin);
    }
  }
}
