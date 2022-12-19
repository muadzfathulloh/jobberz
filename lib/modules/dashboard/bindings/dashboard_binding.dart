import 'package:get/get.dart';
import 'package:jobberz_app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:jobberz_app/services/job_service.dart';
import 'package:jobberz_app/services/user_service.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserService>(() => UserService());
    // Get.lazyPut<JobSevice>(() => JobSevice());

    Get.put<DashboardController>(DashboardController());
  }
}
