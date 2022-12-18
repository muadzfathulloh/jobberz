import 'package:get/get.dart';
import 'package:jobberz_app/modules/detail_job/controllers/detail_job_controller.dart';

class DetailJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DetailJobController>(DetailJobController());
  }
}
