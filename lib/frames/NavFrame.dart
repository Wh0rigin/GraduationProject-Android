import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/MDrawer.dart';
import 'package:graduation_project/pages/main/SensorPage.dart';
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
    final detail = Get.arguments as Map;
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
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Index 0: Home',
                style: optionStyle,
              ),
              StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(detail["data"].toString())));
                      },
                      child: const Text("获取的map"));
                },
              ),
            ],
          )),
          const BookPage(),
          const SensorPage(),
        ].elementAt(_selectedIndex),
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
