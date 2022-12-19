import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jobberz_app/constants/theme.dart';
import 'package:jobberz_app/modules/auth/controllers/login_controller.dart';
import 'package:jobberz_app/routes/app_routes.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          height: Get.height * 0.2,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.elliptical(200, 150)),
                              color: kPrimary.withOpacity(0.6)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Jobberz",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: kSecondary,
                                    ),
                                  ),
                                  SizedBox(height: Get.height * 0.008),
                                  const Text(
                                    "Welcome Back!",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: kSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Form(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller:
                                          controller.emailTextController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        icon:
                                            Icon(Icons.alternate_email_rounded),
                                        hintText: 'Email',
                                        fillColor: kWhite,
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.025),
                                    Obx(
                                      () => TextFormField(
                                        controller:
                                            controller.passwordTextController,
                                        scrollPadding: EdgeInsets.only(
                                            bottom: Get.height * 0.4),
                                        textInputAction: TextInputAction.done,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        decoration: InputDecoration(
                                          icon: const Icon(Icons.lock_rounded),
                                          hintText: 'Password',
                                          fillColor: kWhite,
                                          suffixIcon: IconButton(
                                            color: Colors.grey,
                                            icon: Icon(
                                                controller.isObsecure.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                            onPressed: () {
                                              controller.isObsecure.value =
                                                  !controller.isObsecure.value;
                                            },
                                          ),
                                        ),
                                        autofocus: false,
                                        obscureText:
                                            controller.isObsecure.value,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: const Size(50, 30),
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              alignment: Alignment.center),
                                          child: const Text("Forgot Password?",
                                              style:
                                                  TextStyle(color: kSecondary)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: [
                          Container(
                            width: Get.width,
                            height: Get.height * 0.07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: kSecondary),
                            child: TextButton(
                              onPressed: () {
                                controller.formValdidate();
                                controller.login();
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(color: kWhite),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Haven't Account?"),
                              TextButton(
                                child: const Text('Register'),
                                onPressed: () {
                                  Get.toNamed(RoutesName.register);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
