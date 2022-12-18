import 'package:get/get.dart';
import 'package:jobberz_app/modules/auth/controllers/register_controller.dart';
import 'package:jobberz_app/services/user_service.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut<UserService>(() => UserService());

    // Controller
    Get.put<RegisterController>(RegisterController());
  }
}
