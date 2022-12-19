import 'package:get/get.dart';
import 'package:jobberz_app/modules/auth/bindings/login_binding.dart';
import 'package:jobberz_app/modules/auth/bindings/register_binding.dart';
import 'package:jobberz_app/modules/auth/views/login_view.dart';
import 'package:jobberz_app/modules/auth/views/register_view.dart';
import 'package:jobberz_app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:jobberz_app/modules/dashboard/views/dashboard_view.dart';
import 'package:jobberz_app/modules/dashboard/views/navigation.dart';
import 'package:jobberz_app/modules/dashboard/views/drawer_view.dart';
import 'package:jobberz_app/modules/dashboard/views/detail_job_view.dart';
import 'package:jobberz_app/modules/dashboard/views/profile_view.dart';
import 'package:jobberz_app/modules/splash/bindings/splash_binding.dart';
import 'package:jobberz_app/modules/splash/views/splash_view.dart';
import 'package:jobberz_app/routes/app_routes.dart';

class AppPages {
  static const INITIAL = RoutesName.splash;

  static final pages = [
    GetPage(
      name: RoutesName.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesName.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: RoutesName.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesName.dashboard,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RoutesName.navigation,
      page: () => Navigation(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RoutesName.profile,
      page: () => ProfileView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RoutesName.drawer,
      page: () => DrawerView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RoutesName.detail,
      page: () => DetailJobView(),
      binding: DashboardBinding(),
    ),
  ];
}
