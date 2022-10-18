import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:graduation_project/common/assets.dart';
import 'package:graduation_project/pages/LoginPages.dart';
import 'package:graduation_project/pages/SensorPage.dart';
import '../pages/BookPage.dart';
import 'package:get/get.dart';

class NavStatfulWidget extends StatefulWidget {
  const NavStatfulWidget({super.key});

  @override
  State<NavStatfulWidget> createState() => _NavStatfulWidgetState();
}

class _NavStatfulWidgetState extends State<NavStatfulWidget> {
  int _selectedIndex = 0;
  static const String _title = "图书管理系统";
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  bool isDarkMode = false;
  static final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    const BookPage(),
    const SensorPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        //渐变位置
                        begin: Alignment.topRight, //右上
                        end: Alignment.bottomLeft, //左下
                        stops: [0.0, 1.0], //[渐变起始点, 渐变结束点]
                        //渐变颜色[始点颜色, 结束颜色]
                        colors: [Colors.amber, Colors.yellow])),
                child: Column(
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
                    const Text(
                      'User',
                      style: TextStyle(
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
                    content: Switch(
                        // This bool value toggles the switch.
                        value: isDarkMode,
                        activeColor: Colors.blue,
                        onChanged: (bool? value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            isDarkMode = value!;
                          });
                        }))),
            ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Log out"),
                onTap: () => Get.off(const LoginPage()))
          ],
        ),
      ),
      drawerDragStartBehavior: DragStartBehavior.start,
      primary: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sensors),
            label: 'Sensor',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
