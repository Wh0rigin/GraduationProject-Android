import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text(
                'User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
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
