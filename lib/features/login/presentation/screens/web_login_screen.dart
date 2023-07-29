import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapala_unjani/core/colors.dart';
import 'package:mapala_unjani/core/widgets/custome_textfield.dart';
import 'package:mapala_unjani/features/login/presentation/controller/login_controller.dart';

class WebLoginScreen extends GetView<LoginController> {
  const WebLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: _leftSection(),
          ),
          Expanded(
            flex: 1,
            child: _rightSection(),
          ),
        ],
      ),
    );
  }

  Container _rightSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            child: Image.asset("resources/logo/logo_mapala.png"),
          ),
          const SizedBox(height: 20),
          Text(
            "Selamat Datang!",
            style: TextStyle(
              color: Colors.black.withOpacity(0.75),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Silahkan login untuk dapat mengakses sistem. Hanya admin yang dapat melakukan pembaharuan konten",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFB0B3C4),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 32),
          CustomTextField(
            focusNode: controller.emailFocus,
            label: "Email",
            textController: controller.emailController,
            suffixIcon: const Icon(Icons.mail_outline),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            textController: controller.passwordController,
            focusNode: controller.passwordFocus,
            label: "Password",
            suffixIcon: const Icon(Icons.lock_outline),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Remember Me",
                  style: TextStyle(color: ColorConfig.inActive),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Lupa Password",
                  style: TextStyle(color: ColorConfig.active),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(ColorConfig.active)),
            child: const SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  "Login",
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("resources/logo/logo-google.png", scale: 4),
                    const Text(
                      "Daftar menggunakan Google",
                      style: TextStyle(
                        color: Colors.black54
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _leftSection() {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color.fromARGB(255, 77, 99, 171),
            ColorConfig.active,
          ],
        ),
      ),
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "resources/illustration/il-login.png",
            scale: 4,
          ),
          const SizedBox(height: 24),
          const Text(
            "Mapala Unjani Yogyakarta",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Universitas Jenderal Achmad Yani Yogyakarta",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
