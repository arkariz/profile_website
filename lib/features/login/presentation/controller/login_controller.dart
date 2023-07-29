import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final emailFocus = FocusNode();
  final emailController = TextEditingController();

  final passwordFocus = FocusNode();
  final passwordController = TextEditingController();
}