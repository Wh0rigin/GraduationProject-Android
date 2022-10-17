import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  static int count = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onPressed() {
    setState(() {
      count++;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Hello")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Index 1: Book $count', style: optionStyle),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onPressed,
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add),
        ));
  }
}
