import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/Drawer/MDrawer.dart';
import 'package:graduation_project/pages/main/HomePage.dart';
import 'package:graduation_project/pages/main/SensorPage.dart';
import 'package:graduation_project/utils/utils.dart';
import '../pages/main/BookPage.dart';

class NavFrame extends StatefulWidget {
  const NavFrame({super.key});

  @override
  State<NavFrame> createState() => _NavFrameState();
}

class _NavFrameState extends State<NavFrame> {
  int _selectedIndex = 0;
  static const String _title = "图书管理系统";
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String token = "";

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("登录成功")));
    });
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint("FavFrmae reflush");
    final detail = Get.arguments as Map;
    // debugPrint("detail:$detail");
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
        centerTitle: true,
      ),
      drawer: MDrawer(telephone: detail["data"]["username"].toString()),
      drawerDragStartBehavior: DragStartBehavior.start,
      primary: true,
      body: Center(
        child: <Widget>[
          HomePage(
            name: detail["data"]["username"].toString(),
            pageChage: _onItemTapped,
          ),
          BookPage(
            token: detail["data"]["AccessToken"],
          ),
          SensorPage(
            token: detail["data"]["AccessToken"],
          ),
        ].elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const <Icon>[
          Icon(Icons.home),
          Icon(Icons.book),
          Icon(Icons.sensors)
        ],
        onTap: _onItemTapped,
        backgroundColor: Utils.stringToColor("fcf7ea"),
        animationCurve: Curves.easeIn,
        height: 50,
        index: _selectedIndex,
      ),
    );
  }
}
