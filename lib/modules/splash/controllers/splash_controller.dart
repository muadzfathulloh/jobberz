import 'package:get/get.dart';
import 'package:jobberz_app/routes/app_routes.dart';
import 'package:jobberz_app/utils/storage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  Future<void> checkToken() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Storage.hasData('token')
            ? Get.offAllNamed(RoutesName.navigation)
            : Get.offAllNamed(RoutesName.login);
      },
    );
  }
}
