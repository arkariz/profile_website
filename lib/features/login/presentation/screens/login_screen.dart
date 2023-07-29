import 'package:flutter/material.dart';
import 'package:mapala_unjani/core/widgets/responsive_container.dart';
import 'package:mapala_unjani/features/login/presentation/screens/web_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      builder: ((context, orientation, screenType) {
        if (screenType == ScreenType.desktop){
          return const WebLoginScreen();
        }
        return const WebLoginScreen();
      }),
    );
  }
}
