import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobberz_app/routes/app_routes.dart';
import 'package:jobberz_app/services/user_service.dart';

class RegisterController extends GetxController {
  // Services
  final userService = Get.put(UserService());

  final formKey = GlobalKey<FormState>();

  Future<void> formValdidate() async {
    formKey.currentState?.validate();
  }

  final usernameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final isObsecure = true.obs;

  @override
  void onClose() {
    usernameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  Future<void> register() async {
    final input = <String, dynamic>{
      'username': usernameTextController.text,
      'email': emailTextController.text,
      'password': passwordTextController.text,
    };

    try {
      var registerResponse = await userService.userRegister(input);

      Get.snackbar(
        'Berhasil Mendaftar !',
        // ignore: prefer_interpolation_to_compose_strings
        'Silahkan login terlebih dahulu!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.offNamed(RoutesName.login);
    } catch (e) {
      print(e);
      Get.snackbar(
        'Tedapat Kesalahan !',
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
