import 'package:get/get.dart';

import "package:flutter/material.dart";

import 'router/AppPages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = "图书管理系统";

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _title,
      color: Colors.white,
      theme: ThemeData(primarySwatch: Colors.amber),
      darkTheme: ThemeData(primarySwatch: Colors.brown),
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      // home: const LoginPage()
    );
  }
}
