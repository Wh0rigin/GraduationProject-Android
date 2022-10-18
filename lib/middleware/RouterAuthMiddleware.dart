import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/router/AppRoutes.dart';

class RouteAuthMiddleware extends GetMiddleware {
  // @override
  // int priority = 0;

  // RouteAuthMiddleware({required this.priority});
  //

  // String telephone;
  // String password;
  // RouteAuthMiddleware({required this.telephone, required this.password});
  // @override
  // RouteSettings? redirect(String route) {
  //   Future.delayed(
  //       const Duration(seconds: 1), () => Get.snackbar("提示", "请先登录APP"));
  //   return const RouteSettings(name: AppRoutes.LoginPages);
  // }

  @override
  int? get priority => 0;

// @override
//   RouteSettings redirect(String route) {
//   final authService = Get.find<AuthService>();
//   return authService.authed.value ? null : RouteSettings(name: '/login')
// }

  @override
  RouteSettings redirect(String? route) {
    Future.delayed(
        const Duration(seconds: 1), () => Get.snackbar("提示", "请先登录APP"));

    return const RouteSettings(name: AppRoutes.LoginPages);
    // return const RouteSettings(name: AppRoutes.MainPages);
  }
}
