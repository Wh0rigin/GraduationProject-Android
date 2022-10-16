import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("图书馆管理系统"),
        elevation: 1.5,
        centerTitle: true,
      ),
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> continer = ["Hello world", "Goodbye World"];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$continer[count]"),
        // RaisedButton(
        //     onPressd: () {
        //       setState(() {
        //         count = ++count % 2;
        //       });
        //     },
        //     child: Text("change"))
      ],
    );
  }
}
