import 'package:get/get.dart';
import 'package:jobberz_app/modules/auth/controllers/login_controller.dart';
import 'package:jobberz_app/services/user_service.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut<UserService>(() => UserService());

    // Controller
    Get.put<LoginController>(LoginController());
  }
}
