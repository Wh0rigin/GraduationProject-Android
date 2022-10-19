import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/router/AppRoutes.dart';

import '../common/assets.dart';

class MDrawer extends StatefulWidget {
  const MDrawer({super.key, required this.telephone});
  final String telephone;
  @override
  State<MDrawer> createState() => _MDrawerState();
}

class _MDrawerState extends State<MDrawer> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.0, 1.0],
                      colors: [Colors.orange, Colors.yellow])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100 / 2)),
                      ),
                      Image.asset(
                        AssetsImages.i1367107945Png,
                        width: 75,
                        height: 75,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.telephone,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              )),
          const ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
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
      ),
    );
  }
}
