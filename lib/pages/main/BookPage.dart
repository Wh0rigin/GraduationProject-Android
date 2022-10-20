import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/BookWidgets/BookCard.dart';
import 'package:graduation_project/components/RefreshCard.dart';
import 'package:graduation_project/components/BookWidgets/BookSearchCard.dart';

import '../../api/BookApi.dart';
import '../../utils/utils.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key, required this.token});
  final String token;
  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  String text = '';
  static var widegts = <Widget>[];
  String bookName = "";
  String bookIsbn = "";
  String number = "";
  String rentNumber = "";
  final TextEditingController _editingNameController = TextEditingController();
  final TextEditingController _editingIsbnController = TextEditingController();
  final TextEditingController _editingNumberController =
      TextEditingController();
  final TextEditingController _editingRentNumberController =
      TextEditingController();
  void _onPressed() {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        headerAnimationLoop: false,
        animType: AnimType.bottomSlide,
        showCloseIcon: true,
        closeIcon: const Icon(Icons.close_fullscreen_outlined),
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
        btnOkText: '添加',
        btnOkOnPress: () {
          if (bookName == "" &&
              bookIsbn == "" &&
              number == "" &&
              rentNumber == "") {
            Get.snackbar("添加失败 输入不能为空", bookName);
            return;
          }

          debugPrint('bookName$bookName');
          debugPrint('bookIsbn$bookIsbn');
          debugPrint('number:$number');
          debugPrint('rentNumber:$rentNumber');

          if (!Utils.isNumeric(number) && !Utils.isNumeric(rentNumber)) {
            Get.snackbar("添加失败 数量必须为数字形式", bookName);
            return;
          }

          BookApi.createBook(
                  bookName, bookIsbn, number, rentNumber, widget.token)
              .then((value) {
            if (value.data != null) {
              if (value.data["code"] == 200) {
                fieldValue("");
                Get.snackbar("添加成功 ", bookName);
                bookName = "";
                bookIsbn = "";
                number = "";
                rentNumber = "";
                _editingNameController.clear();
                _editingIsbnController.clear();
                _editingNumberController.clear();
                _editingRentNumberController.clear();
              } else {
                Get.snackbar("添加失败 ", value.data["msg"]);
              }
            }
          });
        },
        body: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                controller: _editingNameController,
                decoration: const InputDecoration(
                  labelText: "书本名称",
                  hintText: "请输入书本名称",
                  prefixIcon: Icon(Icons.menu_book_outlined),
                  suffixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                onChanged: (value) => {bookName = value.toString()},
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _editingIsbnController,
                decoration: const InputDecoration(
                    labelText: "Isbn号",
                    hintText: "请输入Isbn号",
                    prefixIcon: Icon(Icons.book),
                    suffixIcon: Icon(Icons.edit),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                onChanged: (value) => {bookIsbn = value.toString()},
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _editingNumberController,
                decoration: const InputDecoration(
                    labelText: "总在馆书目",
                    hintText: "请输入在馆书目",
                    prefixIcon: Icon(Icons.format_list_numbered),
                    suffixIcon: Icon(Icons.edit),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                onChanged: (value) => {number = value.toString()},
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _editingRentNumberController,
                decoration: const InputDecoration(
                    labelText: "借出书目",
                    hintText: "请输入借出书目",
                    prefixIcon: Icon(Icons.format_list_numbered_rtl),
                    suffixIcon: Icon(Icons.edit),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                onChanged: (value) => {rentNumber = value.toString()},
              ),
            ]))).show();

    // Get.defaultDialog(
    //   title: "添加书目",
    //   confirm: ElevatedButton(
    //       onPressed: () {
    //         if (bookName == "" &&
    //             bookIsbn == "" &&
    //             number == "" &&
    //             rentNumber == "") {
    //           Get.snackbar("添加失败 输入不能为空", bookName);
    //           return;
    //         }

    //         debugPrint('bookName$bookName');
    //         debugPrint('bookIsbn$bookIsbn');
    //         debugPrint('number:$number');
    //         debugPrint('rentNumber:$rentNumber');

    //         if (!Utils.isNumeric(number) && !Utils.isNumeric(rentNumber)) {
    //           Get.snackbar("添加失败 数量必须为数字形式", bookName);
    //           return;
    //         }

    //         BookApi.createBook(
    //                 bookName, bookIsbn, number, rentNumber, widget.token)
    //             .then((value) {
    //           if (value.data != null) {
    //             if (value.data["code"] == 200) {
    //               fieldValue("");
    //               Get.snackbar("添加成功 ", bookName);
    //               bookName = "";
    //               bookIsbn = "";
    //               number = "";
    //               rentNumber = "";
    //               _editingNameController.clear();
    //               _editingIsbnController.clear();
    //               _editingNumberController.clear();
    //               _editingRentNumberController.clear();
    //             } else {
    //               Get.snackbar("添加失败 ", value.data["msg"]);
    //             }
    //           }
    //         });

    //         // TODO Enhance
    //       },
    //       child: const Text("OK")),
    //   content: Padding(
    //       padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
    //       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //         TextField(
    //           controller: _editingNameController,
    //           decoration: const InputDecoration(
    //             labelText: "书本名称",
    //             hintText: "请输入书本名称",
    //             prefixIcon: Icon(Icons.menu_book_outlined),
    //             suffixIcon: Icon(Icons.edit),
    //             border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.all(Radius.circular(30))),
    //           ),
    //           onChanged: (value) => {bookName = value.toString()},
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         TextField(
    //           controller: _editingIsbnController,
    //           decoration: const InputDecoration(
    //               labelText: "Isbn号",
    //               hintText: "请输入Isbn号",
    //               prefixIcon: Icon(Icons.book),
    //               suffixIcon: Icon(Icons.edit),
    //               border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(30)))),
    //           onChanged: (value) => {bookIsbn = value.toString()},
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         TextField(
    //           controller: _editingNumberController,
    //           decoration: const InputDecoration(
    //               labelText: "总在馆书目",
    //               hintText: "请输入在馆书目",
    //               prefixIcon: Icon(Icons.format_list_numbered),
    //               suffixIcon: Icon(Icons.edit),
    //               border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(30)))),
    //           onChanged: (value) => {number = value.toString()},
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         TextField(
    //           controller: _editingRentNumberController,
    //           decoration: const InputDecoration(
    //               labelText: "借出书目",
    //               hintText: "请输入借出书目",
    //               prefixIcon: Icon(Icons.format_list_numbered_rtl),
    //               suffixIcon: Icon(Icons.edit),
    //               border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(30)))),
    //           onChanged: (value) => {rentNumber = value.toString()},
    //         ),
    //       ])),
    // );
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
              });
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
                  availableNumber: books[i]["AvailableNumber"].toString(),
                  number: books[i]["Number"].toString(),
                  bookIsbn: books[i]["Isbn"],
                  fieldValue: fieldValue,
                  token: widget.token,
                ));
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
              });
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
                widegts.add(
                  BookCard(
                    bookName: books[i]["Name"],
                    availableNumber: books[i]["AvailableNumber"].toString(),
                    bookIsbn: books[i]["Isbn"],
                    number: books[i]["Number"].toString(),
                    fieldValue: fieldValue,
                    token: widget.token,
                  ),
                );
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
                  availableNumber: books[i]["AvailableNumber"].toString(),
                  fieldValue: fieldValue,
                  number: books[i]["Number"].toString(),
                  bookIsbn: books[i]["Isbn"],
                  token: widget.token,
                ));
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
        backgroundColor: Utils.stringToColor("fcf7ea"),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: widegts + [],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onPressed,
          backgroundColor: Colors.orange.shade400,
          child: const Icon(Icons.add),
        ));
  }
}
