import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobberz_app/constants/strings.dart';
import 'package:jobberz_app/models/job_model.dart';
import 'package:jobberz_app/models/user_model.dart';
import 'package:jobberz_app/routes/app_routes.dart';
import 'package:jobberz_app/services/job_service.dart';
import 'package:jobberz_app/services/user_service.dart';
import 'package:jobberz_app/utils/storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;
  int idJob = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  final userService = Get.put(UserService());
  final jobService = Get.put(JobSevice());

  final TextEditingController jobNameTextController = TextEditingController();
  final TextEditingController companyTextController = TextEditingController();
  final TextEditingController rateTextController = TextEditingController();
  final TextEditingController sallaryTextController = TextEditingController();

  var jobs = <JobDataModel>[].obs;

  var user = UserModel(
          id: 0,
          username: '',
          email: '',
          emailVerifiedAt: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now())
      .obs;

  var job_model = JobDataModel(
    id: 0,
    jobName: '',
    company: '',
    rate: '',
    sallary: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    // categories: [],
  ).obs;

  @override
  void onInit() {
    getUserProfile();
    getJobs();
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void openEndDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  Future<void> getUserProfile() async {
    var userProfileResponse = await userService.userProfile();
    if (userProfileResponse != null) {
      user.update((user) {
        user!.id = userProfileResponse.id;
        user.username = userProfileResponse.username;
        user.email = userProfileResponse.email;
      });
    }
  }

  Future<void> logout() async {
    try {
      Get.snackbar(
        'Sukses'.tr,
        'Berhasil Keluar !'.tr,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );

      Storage.removeValue(storageToken)
          .then((value) => Get.offAllNamed(RoutesName.login));

      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;

      var payload = <String, dynamic>{"onesignal_id": osUserID};
      await userService.userLogout(payload);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getJobs() async {
    try {
      final response = await jobService.getJob();
      if (response != null) {
        jobs.assignAll(response);
      }
    } catch (e) {
      print('err' + e.toString());
    }
  }

  Future<void> createJob() async {
    Get.closeAllSnackbars();

    var input = <String, dynamic>{
      'job_name': jobNameTextController.text,
      'company': companyTextController.text,
      'rate': rateTextController.text,
      'sallary': sallaryTextController.text,
    };

    try {
      var jobResponse = await jobService.createJob(input);
      if (jobResponse) {
        await getJobs();

        resetAllInput();

        Get.back();

        Get.snackbar(
          'Sukses'.tr,
          'Berhasil Membuat Job',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Gagal Membuat Job !',
        '$e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }
  }

  Future<void> resetAllInput() async {
    idJob = 0;
    jobNameTextController.text = "";
    companyTextController.text = "";
    rateTextController.text = "";
    sallaryTextController.text = "";
  }
}
