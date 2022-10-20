import 'package:flutter/material.dart';
import 'package:graduation_project/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.name});

  final String name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Utils.stringToColor("fcf7ea"),
        body: Center(
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
                            SnackBar(content: Text(widget.name.toString())));
                      },
                      child: const Text("获取的map"));
                },
              ),
            ],
          ),
        ));
  }
}
