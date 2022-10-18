import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

import '../frames/NavStatfulWidget.dart';
import '../utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const String _title = "图书管理系统";
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  Duration get loginTime => const Duration(milliseconds: 2250);
  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');

    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  String? checkTelephone(String? value) {
    int? len = 0;
    len = value?.length;
    if (!Utils.isNumeric(value ?? "")) {
      return "电话号码必须为数字";
    }
    if (len! < 11) {
      return "电话号码必须大于10位";
    }
    return null;
  }

  String? checkPassword(String? value) {
    int? len = 0;
    len = value?.length;

    if (len! < 6) {
      return "密码必须大于6位";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text(_title),
    //   ),
    //   body: Padding(
    //       padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           const TextField(
    //             decoration: InputDecoration(
    //                 labelText: "用户名",
    //                 hintText: "请输入用户名(电话号码)",
    //                 prefixIcon: Icon(Icons.person),
    //                 suffixIcon: Icon(Icons.edit),
    //                 border: OutlineInputBorder()),
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           const TextField(
    //             decoration: InputDecoration(
    //                 labelText: "密码",
    //                 hintText: "请输入密码",
    //                 prefixIcon: Icon(Icons.password),
    //                 suffixIcon: Icon(Icons.edit),
    //                 border: OutlineInputBorder()),
    //             obscuringCharacter: '*',
    //             obscureText: true,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
    //             child: Row(
    //               mainAxisSize: MainAxisSize.max,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 const Spacer(),
    //                 ElevatedButton(
    //                   onPressed: () => Get.off(const NavStatfulWidget()),
    //                   child: const Text(
    //                     "登录",
    //                     style: optionStyle,
    //                   ),
    //                 ),
    //                 const Spacer(),
    //                 ElevatedButton(
    //                     onPressed: () => Get.to(const RegisterPage()),
    //                     child: const Text(
    //                       "注册",
    //                       style: optionStyle,
    //                     )),
    //                 const Spacer(),
    //               ],
    //             ),
    //           )
    //         ],
    //       )),
    // );
    return FlutterLogin(
      onLogin: _authUser,
      onRecoverPassword: _recoverPassword,
      onSignup: (_) => Future(() => null),
      userType: LoginUserType.phone,
      hideForgotPasswordButton: true,
      onSubmitAnimationCompleted: () {
        Get.to(const NavStatfulWidget());
      },
      userValidator: checkTelephone,
    );
  }
}
