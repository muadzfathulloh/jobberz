import 'package:get/get.dart';
import 'package:jobberz_app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  Future<void> checkToken() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        Get.offAllNamed(RoutesName.login);
      },
    );
  }
}
