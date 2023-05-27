import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mapala_unjani/core/route/app_pages.dart';
import 'package:mapala_unjani/core/route/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.routes,
      initialRoute: Routes.LOGIN,
    );
  }
}
