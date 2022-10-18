import 'package:graduation_project/frames/NavFrame.dart';
import 'package:graduation_project/pages/login/LoginPages.dart';

import '../middleware/RouterAuthMiddleware.dart';
import '../pages/notfound/NotfoundView.dart';
import 'AppRoutes.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = AppRoutes.LoginPages;
  static final routes = [
    GetPage(
      name: AppRoutes.LoginPages,
      page: () => const LoginPage(),
    ),
    GetPage(
        name: AppRoutes.MainPages,
        page: () => const NavFrame(),
        middlewares: [RouteAuthMiddleware()])
  ];
  static final unknownRoute =
      GetPage(name: AppRoutes.NotFound, page: () => const NotfoundView());
}
