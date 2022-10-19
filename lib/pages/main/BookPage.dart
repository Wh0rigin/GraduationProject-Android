import 'package:flutter/material.dart';
import 'package:graduation_project/components/RefreshCard.dart';
import 'package:graduation_project/components/BookSearchCard.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key, required this.token});
  final String token;
  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  static int count = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  String text = '';
  static var widegts = <Widget>[];

  void _onPressed() {
    setState(() {
      count++;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Hello")));
    });
  }

  @override
  void initState() {
    super.initState();
    if (widegts.isEmpty) {
      widegts.addAll([
        const RefreshCard(
          name: "书本",
        ),
        BookSearchCard(
          fieldValue: (String value) {
            setState(() {
              text = value;
            });
          },
          token: widget.token,
        )
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: widegts,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onPressed,
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add),
        ));
  }
}
