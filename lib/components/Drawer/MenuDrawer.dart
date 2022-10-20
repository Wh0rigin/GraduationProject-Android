import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/router/AppRoutes.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () => Get.defaultDialog(
                // onConfirm: () => print("Ok"),
                title: "用户信息",
                content: Column(
                  children: const [
                    Text("用户名:User"),
                    Text("手机号:123456689"),
                    Text("注册时间:yyyy-MM-dd")
                  ],
                ))),
        ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Get.defaultDialog(
                  // onConfirm: () => print("Ok"),
                  title: "Setting",
                  content: StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      // _setter = setState;
                      return Switch(
                          // This bool value toggles the switch.
                          value: isDarkMode,
                          activeColor: Colors.blue,
                          onChanged: (bool? value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              isDarkMode = value!;
                            });
                          });
                    },
                  ),
                )),
        ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Log out"),
            onTap: () => Get.offAllNamed(AppRoutes.LoginPages))
      ],
    );
  }
}
