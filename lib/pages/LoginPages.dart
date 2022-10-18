import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/frames/NavStatfulWidget.dart';
import 'package:graduation_project/pages/registerPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const String _title = "图书管理系统";
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "请输入用户名(电话号码)",
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.edit),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请输入密码",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.edit),
                    border: OutlineInputBorder()),
                obscuringCharacter: '*',
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () => Get.off(const NavStatfulWidget()),
                      child: const Text(
                        "登录",
                        style: optionStyle,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () => Get.to(const RegisterPage()),
                        child: const Text(
                          "注册",
                          style: optionStyle,
                        )),
                    const Spacer(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
