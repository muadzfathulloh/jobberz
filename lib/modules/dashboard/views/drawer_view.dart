import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jobberz_app/constants/theme.dart';
import 'package:jobberz_app/modules/dashboard/controllers/dashboard_controller.dart';

class DrawerView extends StatelessWidget {
  DrawerView({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            color: kPrimary,
            height: Get.height * 0.08,
          ),
          ListView(
            children: <Widget>[
              Container(
                color: kPrimary,
                height: Get.height * 0.25,
                child: DrawerHeader(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/profile-2.png',
                        width: 80,
                      ),
                      const Text(
                        'Mu\'adz Fathulloh',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const Text(
                        'Mobile Developer',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              DrawerListTile(
                onTap: () {
                  // Get.toNamed(RoutesName.dashboard);
                },
                icon: 'assets/icons/bio-drawer.svg',
                title: 'Biodata',
              ),
              const SizedBox(
                height: 5,
              ),
              DrawerListTile(
                onTap: () {},
                icon: 'assets/icons/resume-drawer.svg',
                title: 'Resume',
              ),
              const SizedBox(
                height: 5,
              ),
              DrawerListTile(
                onTap: () {},
                icon: 'assets/icons/porto-drawer.svg',
                title: 'Portofolio',
              ),
              SizedBox(
                height: Get.height * 0.2,
              ),
              DrawerListTile(
                onTap: () {},
                icon: 'assets/icons/linkedin.svg',
                title: '@muadzfathulloh',
              ),
              const SizedBox(
                height: 5,
              ),
              DrawerListTile(
                onTap: () {},
                icon: 'assets/icons/telegram.svg',
                title: '@muadzfathulloh',
              ),
              const Divider(
                thickness: 1,
              ),
              DrawerListTile(
                onTap: () {},
                icon: 'assets/icons/info-drawer.svg',
                title: 'About App',
              ),
              const SizedBox(
                height: 5,
              ),
              DrawerListTile(
                onTap: () {
                  controller.logout();
                },
                icon: 'assets/icons/logout-drawer.svg',
                title: 'Sign Out',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({super.key, this.icon, this.title, this.onTap});

  final String? icon;
  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap!,
      dense: true,
      leading: SvgPicture.asset(icon!),
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF274C70),
        ),
      ),
    );
  }
}
