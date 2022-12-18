import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobberz_app/models/user_model.dart';
import 'package:jobberz_app/routes/app_routes.dart';
import 'package:jobberz_app/services/user_service.dart';
import 'package:jobberz_app/utils/storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var user = UserModel(
          id: 0,
          username: '',
          email: '',
          emailVerifiedAt: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now())
      .obs;

  @override
  void onInit() {
    getUserProfile();
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
    print(userProfileResponse);
    if (userProfileResponse != null) {
      user.update((user) {
        user!.id = userProfileResponse.id;
        user.username = userProfileResponse.username;
        user.email = userProfileResponse.email;
      });
    }
  }

  final userService = Get.put(UserService());

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

      Storage.removeValue("token")
          .then((value) => Get.offAllNamed(RoutesName.login));

      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;

      var payload = <String, dynamic>{"onesignal_id": osUserID};
      await userService.userLogout(payload);
    } catch (e) {
      print(e);
    }
  }
}
