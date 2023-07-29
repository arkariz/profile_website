import 'package:get/route_manager.dart';
import 'package:mapala_unjani/core/route/app_routes.dart';
import 'package:mapala_unjani/features/login/presentation/controller/login_binding.dart';
import 'package:mapala_unjani/features/login/presentation/screens/login_screen.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
