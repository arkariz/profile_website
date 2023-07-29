import 'package:get/get.dart';
import 'package:mapala_unjani/features/login/presentation/controller/login_controller.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<LoginController>(() => LoginController());
  }
}