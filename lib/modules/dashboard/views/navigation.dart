import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobberz_app/modules/category_screen.dart';
import 'package:jobberz_app/modules/chat_screen.dart';
import 'package:jobberz_app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:jobberz_app/modules/dashboard/views/dashboard_view.dart';
import 'package:jobberz_app/modules/dashboard/views/drawer_view.dart';
import 'package:jobberz_app/modules/save_screen.dart';
import 'package:jobberz_app/widgets/icon_bottom.dart';

class Navigation extends StatelessWidget {
  Navigation({super.key});
  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (c) {
        return Scaffold(
          key: controller.scaffoldKey,
          endDrawer: c.tabIndex == 0 ? DrawerView() : null,
          body: IndexedStack(
            index: c.tabIndex,
            children: [
              DashboardView(),
              ChatScreen(),
              SaveScreen(),
              CategoryScreen(),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 10,
            child: SizedBox(
              height: Get.height * 0.08,
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                    icon: "assets/icons/home-nav.svg",
                    onPressed: () {
                      controller.changeTabIndex(0);
                    },
                  ),
                  IconBottomBar(
                    icon: "assets/icons/chat-nav.svg",
                    onPressed: () {
                      controller.changeTabIndex(1);
                    },
                  ),
                  IconBottomBar(
                    icon: "assets/icons/save-nav.svg",
                    onPressed: () {
                      controller.changeTabIndex(2);
                    },
                  ),
                  IconBottomBar(
                    icon: "assets/icons/category-nav.svg",
                    onPressed: () {
                      controller.changeTabIndex(3);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
