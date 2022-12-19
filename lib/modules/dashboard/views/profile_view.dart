import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jobberz_app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:jobberz_app/widgets/recommended_card.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset('assets/icons/back-button.svg'),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/profile-3.png',
                      width: Get.width * 0.25,
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => Text(
                        controller.user.value.username,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF274C70),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('Mobile Developer',
                        style: TextStyle(
                          color: Color(0XFF688394),
                        )),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Text(
                              '27',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0XFF274C70),
                              ),
                            ),
                            Text(
                              'Applied',
                              style: TextStyle(
                                color: Color(0XFF688394),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '19',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0XFF274C70),
                              ),
                            ),
                            Text(
                              'Reviewed',
                              style: TextStyle(
                                color: Color(0XFF688394),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '12',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0XFF274C70),
                              ),
                            ),
                            Text(
                              'Interview',
                              style: TextStyle(
                                color: Color(0XFF688394),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Experience',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF274C70)),
                  ),
                  Text('See all'),
                ],
              ),
              const SizedBox(height: 20),
              const RecommendedCard(
                topLeft: 'Mobile Developer',
                bottomLeft: 'Pawang Team',
                topRight: 'Surabaya, Jawa Timur',
                bottomRight: 'Feb 22 - Jan 23',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Education',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF274C70)),
                  ),
                  Text('See all'),
                ],
              ),
              const SizedBox(height: 20),
              const RecommendedCard(
                topLeft: 'Informatics Enginer',
                bottomLeft: 'Student',
                topRight: 'PENS, Surabaya',
                bottomRight: '2020 - Now',
              ),
              const RecommendedCard(
                topLeft: 'Flutter Bootcamp',
                bottomLeft: 'Participant',
                topRight: 'Sanbercode',
                bottomRight: 'Nov 22 - Dec 23',
              ),
              const SizedBox(height: 30),
              const Text(
                'Social Media',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF274C70)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0XFFD9D9D9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/icons/linkedin.svg',
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Obx(
                        () => Text(
                          '@' + controller.user.value.username,
                          style: TextStyle(
                            color: Color(0XFF274C70),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Linkedin',
                        style: TextStyle(
                          color: Color(0XFF688394),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0XFFD9D9D9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/icons/telegram.svg',
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Obx(
                        () => Text(
                          '@' + controller.user.value.username,
                          style: TextStyle(
                            color: Color(0XFF274C70),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Telegram',
                        style: TextStyle(
                          color: Color(0XFF688394),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
