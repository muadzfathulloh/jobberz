import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobberz_app/constants/theme.dart';
import 'package:jobberz_app/modules/auth/controllers/register_controller.dart';
import 'package:jobberz_app/routes/app_routes.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final controller = Get.find<RegisterController>();

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
                                  Text(
                                    "Jobberz",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: bold,
                                      color: kSecondary,
                                    ),
                                  ),
                                  SizedBox(height: Get.height * 0.008),
                                  const Text(
                                    "Register Now",
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
                                          controller.usernameTextController,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.person),
                                        hintText: 'Username',
                                        fillColor: kWhite,
                                      ),
                                    ),
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
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4),
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
                                controller.register();
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(color: kWhite),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Have an Account?"),
                              TextButton(
                                child: const Text('Sign in'),
                                onPressed: () {
                                  Get.offNamed(RoutesName.login);
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
