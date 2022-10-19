import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:graduation_project/components/BookCard.dart';
import 'package:graduation_project/components/RefreshCard.dart';
import 'package:graduation_project/components/BookSearchCard.dart';

import '../../api/BookApi.dart';

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

  void fieldValue(String value) {
    debugPrint(value);
    if (value != "") {
      BookApi.getBookByIsbn(value, widget.token).then((value) {
        if (value.data != null) {
          debugPrint(value.data.toString());
          if (value.data["code"] == 200) {
            // debugPrint(value.data["data"]["count"].toString());
            if (value.data["data"]["count"] == 0) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("暂时没有这个书目哦")));
              return;
            }
            setState(() {
              widegts.clear();
              widegts.addAll([
                const RefreshCard(
                  name: "书本",
                ),
                BookSearchCard(
                  fieldValue: fieldValue,
                  token: widget.token,
                )
              ]);
              List books = value.data["data"]["payload"];
              for (int i = 0; i < books.length; i++) {
                widegts.add(BookCard(
                    bookName: books[i]["Name"],
                    availableNumber: books[i]["AvailableNumber"]));
              }
            });
          }
        }
      });
    } else {
      BookApi.getAllBook(widget.token).then((value) {
        if (value.data != null) {
          debugPrint(value.data.toString());
          if (value.data["code"] == 200) {
            // debugPrint(value.data["data"]["count"].toString());
            if (value.data["data"]["count"] == 0) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("馆内暂时没有书哦")));
              return;
            }
            setState(() {
              widegts.clear();
              widegts.addAll([
                const RefreshCard(
                  name: "书本",
                ),
                BookSearchCard(
                  fieldValue: fieldValue,
                  token: widget.token,
                )
              ]);
              List books = value.data["data"]["payload"];
              for (int i = 0; i < books.length; i++) {
                widegts.add(BookCard(
                    bookName: books[i]["Name"],
                    availableNumber: books[i]["AvailableNumber"]));
              }
            });
          }
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      BookApi.getAllBook(widget.token).then((value) {
        if (value.data != null) {
          debugPrint(value.data.toString());
          if (value.data["code"] == 200) {
            // debugPrint(value.data["data"]["count"].toString());
            if (value.data["data"]["count"] == 0) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("馆内暂时没有书哦")));
              return;
            }
            setState(() {
              widegts.clear();
              widegts.addAll([
                const RefreshCard(
                  name: "书本",
                ),
                BookSearchCard(
                  fieldValue: fieldValue,
                  token: widget.token,
                )
              ]);
              List books = value.data["data"]["payload"];
              for (int i = 0; i < books.length; i++) {
                widegts.add(BookCard(
                    bookName: books[i]["Name"],
                    availableNumber: books[i]["AvailableNumber"]));
              }
            });
          }
        }
      });
    });
    if (mounted == true) {
      if (widegts.isEmpty) {
        widegts.addAll([
          const RefreshCard(
            name: "书本",
          ),
          BookSearchCard(
            fieldValue: fieldValue,
            token: widget.token,
          )
        ]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widegts.toString());
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: widegts + [],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onPressed,
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add),
        ));
  }
}
