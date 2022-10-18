import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart' hide Response;
import 'package:graduation_project/api/authApi.dart';
import 'package:graduation_project/frames/NavFrame.dart';

import '../../utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var dio = Dio();

  Duration get loginTime => const Duration(milliseconds: 1000);
  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    // debugPrint(AuthApi.authLogin(data.name, data.password));
    // TestApi.posttest422("123")
    //     .then((value) => debugPrint('POST:${value.data}'));
    AuthApi.authLogin(data.name, data.password)
        .then((value) => debugPrint('POST:${value.data}'));
    return Future.delayed(loginTime).then((_) {
      //return non-null string faild
      // debugPrint(response.statusCode.toString());
      //null success
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
        Get.offAll(const NavFrame(), arguments: {"status": "success"});
      },
      userValidator: checkTelephone,
      passwordValidator: checkPassword,
    );
  }
}
