import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobberz_app/constants/strings.dart';
import 'package:jobberz_app/routes/app_routes.dart';
import 'package:jobberz_app/services/user_service.dart';
import 'package:jobberz_app/utils/storage.dart';

class LoginController extends GetxController {
  // Services
  final userService = Get.put(UserService());

  final formKey = GlobalKey<FormState>();

  Future<void> formValdidate() async {
    formKey.currentState?.validate();
  }

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final isObsecure = true.obs;

  var isLoading = false;

  @override
  void onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    try {
      var input = <String, dynamic>{
        'email': emailTextController.text,
        'password': passwordTextController.text,
      };
      final loginResponse = await userService.userLogin(input);
      var tokken = loginResponse?.data.accesToken;
      Storage.saveValue(storageToken, loginResponse?.data.accesToken);
      print('token :$tokken');
      Get.snackbar(
        'Berhasil Masuk !',
        // ignore: unnecessary_string_interpolations
        'Selamat Datang ' + '${loginResponse?.data.user.username}',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.offAllNamed(RoutesName.navigation);
    } catch (e) {
      Get.snackbar(
        'Gagal Masuk !',
        e.toString(),
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
}
