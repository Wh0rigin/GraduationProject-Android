import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api/BookApi.dart';
import 'package:graduation_project/utils/utils.dart';

class BookCard extends StatefulWidget {
  const BookCard(
      {super.key,
      required this.bookName,
      required this.availableNumber,
      required this.number,
      required this.bookIsbn,
      required this.fieldValue,
      required this.token});

  final String bookName;
  final String availableNumber;
  final String number;
  final String bookIsbn;
  final String token;
  final ValueChanged<String> fieldValue;

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  String mNumber = "";
  String mAvailableNumber = "";
  String curNum = "";
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final TextEditingController _editingCurNumController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      mNumber = widget.number;
      mAvailableNumber = widget.availableNumber;
    });
  }

  bool curTextCheck(String str) {
    if (str == "" && !Utils.isNumeric(str)) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text(widget.bookName),
              subtitle: Text('可借阅数量:${widget.availableNumber}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Isbn:${widget.bookIsbn}',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 15),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.infoReverse,
                      headerAnimationLoop: false,
                      animType: AnimType.topSlide,
                      showCloseIcon: true,
                      closeIcon: const Icon(Icons.close_fullscreen_outlined),
                      onDismissCallback: (type) {
                        debugPrint('Dialog Dissmiss from callback $type');
                      },
                      btnCancelText: "删除书目",
                      btnCancelOnPress: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          headerAnimationLoop: false,
                          animType: AnimType.topSlide,
                          showCloseIcon: true,
                          closeIcon:
                              const Icon(Icons.close_fullscreen_outlined),
                          title: '警告',
                          desc: '你确定要删除这本书吗?',
                          btnCancelOnPress: () {},
                          onDismissCallback: (type) {
                            debugPrint('Dialog Dissmiss from callback $type');
                          },
                          btnCancelText: '取消',
                          btnOkText: '删除',
                          btnOkOnPress: () {
                            BookApi.deleteBook(widget.bookIsbn, widget.token)
                                .then((value) {
                              if (value.data != null) {
                                debugPrint(value.data.toString());
                                Get.snackbar(value.data["msg"].toString(),
                                    widget.bookName);
                                widget.fieldValue("");
                              }
                            });
                          },
                        ).show();
                      },
                      body: StatefulBuilder(
                          builder: (BuildContext context, setState) {
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Center(
                                child: Column(children: [
                              Text(
                                "书本名称:${widget.bookName}",
                                style: optionStyle,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Isbn编码:${widget.bookIsbn}",
                                style: optionStyle,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _editingCurNumController,
                                decoration: const InputDecoration(
                                  labelText: "操作数量",
                                  hintText: "请输入操作数",
                                  prefixIcon: Icon(Icons.assignment_outlined),
                                  suffixIcon: Icon(Icons.edit),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                ),
                                onChanged: (value) {
                                  setState(() => {curNum = value.toString()});
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("馆藏数量:$mNumber"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    child: const Text("添加"),
                                    onPressed: () {
                                      if (curTextCheck(curNum)) {
                                        BookApi.addBook(widget.bookIsbn, curNum,
                                                widget.token)
                                            .then((value) {
                                          if (value.data != null) {
                                            if (value.data["code"] == 200) {
                                              widget.fieldValue("");

                                              setState(() {
                                                mNumber = (int.parse(mNumber) +
                                                        int.parse(curNum))
                                                    .toString();
                                                mAvailableNumber = (int.parse(
                                                            mAvailableNumber) +
                                                        int.parse(curNum))
                                                    .toString();
                                              });
                                              curNum = "";
                                              _editingCurNumController.clear();
                                            }
                                            Get.snackbar(
                                                value.data["msg"].toString(),
                                                widget.bookName);
                                          }
                                          curNum = "";
                                          _editingCurNumController.clear();
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    child: const Text("删除"),
                                    onPressed: () {
                                      if (curTextCheck(curNum)) {
                                        BookApi.reduceBook(widget.bookIsbn,
                                                curNum, widget.token)
                                            .then((value) {
                                          if (value.data != null) {
                                            if (value.data["code"] == 200) {
                                              widget.fieldValue("");
                                              setState(() {
                                                mNumber = (int.parse(mNumber) -
                                                        int.parse(curNum))
                                                    .toString();
                                                mAvailableNumber = (int.parse(
                                                            mAvailableNumber) -
                                                        int.parse(curNum))
                                                    .toString();
                                              });
                                              curNum = "";
                                              _editingCurNumController.clear();
                                            }
                                            Get.snackbar(
                                                value.data["msg"].toString(),
                                                widget.bookName);
                                          }
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("可借数量:$mAvailableNumber"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    child: const Text("归还"),
                                    onPressed: () {
                                      if (curTextCheck(curNum)) {
                                        BookApi.returnBook(widget.bookIsbn,
                                                curNum, widget.token)
                                            .then((value) {
                                          if (value.data != null) {
                                            if (value.data["code"] == 200) {
                                              widget.fieldValue("");
                                              setState(() {
                                                mAvailableNumber = (int.parse(
                                                            mAvailableNumber) +
                                                        int.parse(curNum))
                                                    .toString();
                                              });
                                              curNum = "";
                                              _editingCurNumController.clear();
                                            }
                                            Get.snackbar(
                                                value.data["msg"].toString(),
                                                widget.bookName);
                                          }
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    child: const Text("借出"),
                                    onPressed: () {
                                      if (curTextCheck(curNum)) {
                                        BookApi.rentBook(widget.bookIsbn,
                                                curNum, widget.token)
                                            .then((value) {
                                          debugPrint(value.data.toString());
                                          if (value.data != null) {
                                            if (value.data["code"] == 200) {
                                              widget.fieldValue("");
                                              setState(() {
                                                mAvailableNumber = (int.parse(
                                                            mAvailableNumber) -
                                                        int.parse(curNum))
                                                    .toString();
                                              });
                                              curNum = "";
                                              _editingCurNumController.clear();
                                            }
                                            Get.snackbar(
                                                value.data["msg"].toString(),
                                                widget.bookName);
                                          }
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ])));
                      })).show();

                  // Get.defaultDialog(
                  //     title: '书本详情',
                  //     middleText: "点击窗口外以返回",
                  //     content: StatefulBuilder(
                  //         builder: (BuildContext context, setState) {
                  //       return Padding(
                  //           padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  //           child: Column(
                  //             children: [
                  //               Text("书本名称:${widget.bookName}"),
                  //               const SizedBox(
                  //                 height: 10,
                  //               ),
                  //               Text("Isbn编码:${widget.bookIsbn}"),
                  //               const SizedBox(
                  //                 height: 10,
                  //               ),
                  //               TextField(
                  //                 controller: _editingCurNumController,
                  //                 decoration: const InputDecoration(
                  //                   labelText: "操作数量",
                  //                   hintText: "请输入操作数",
                  //                   prefixIcon: Icon(Icons.assignment_outlined),
                  //                   suffixIcon: Icon(Icons.edit),
                  //                   border: OutlineInputBorder(
                  //                       borderRadius: BorderRadius.all(
                  //                           Radius.circular(30))),
                  //                 ),
                  //                 onChanged: (value) {
                  //                   setState(() => {curNum = value.toString()});
                  //                 },
                  //               ),
                  //               const SizedBox(
                  //                 height: 10,
                  //               ),
                  //               Row(
                  //                 children: [
                  //                   Text("馆藏数量:$mNumber"),
                  //                   const SizedBox(
                  //                     width: 10,
                  //                   ),
                  //                   ElevatedButton(
                  //                     child: const Text("添加"),
                  //                     onPressed: () {
                  //                       if (curTextCheck(curNum)) {
                  //                         BookApi.addBook(widget.bookIsbn,
                  //                                 curNum, widget.token)
                  //                             .then((value) {
                  //                           if (value.data != null) {
                  //                             if (value.data["code"] == 200) {
                  //                               widget.fieldValue("");

                  //                               setState(() {
                  //                                 mNumber =
                  //                                     (int.parse(mNumber) +
                  //                                             int.parse(curNum))
                  //                                         .toString();
                  //                                 mAvailableNumber = (int.parse(
                  //                                             mAvailableNumber) +
                  //                                         int.parse(curNum))
                  //                                     .toString();
                  //                               });
                  //                               curNum = "";
                  //                               _editingCurNumController
                  //                                   .clear();
                  //                             }
                  //                             Get.snackbar(
                  //                                 value.data["msg"].toString(),
                  //                                 widget.bookName);
                  //                           }
                  //                           curNum = "";
                  //                           _editingCurNumController.clear();
                  //                         });
                  //                       }
                  //                     },
                  //                   ),
                  //                   const SizedBox(
                  //                     width: 10,
                  //                   ),
                  //                   ElevatedButton(
                  //                     child: const Text("删除"),
                  //                     onPressed: () {
                  //                       if (curTextCheck(curNum)) {
                  //                         BookApi.reduceBook(widget.bookIsbn,
                  //                                 curNum, widget.token)
                  //                             .then((value) {
                  //                           if (value.data != null) {
                  //                             if (value.data["code"] == 200) {
                  //                               widget.fieldValue("");
                  //                               setState(() {
                  //                                 mNumber =
                  //                                     (int.parse(mNumber) -
                  //                                             int.parse(curNum))
                  //                                         .toString();
                  //                                 mAvailableNumber = (int.parse(
                  //                                             mAvailableNumber) -
                  //                                         int.parse(curNum))
                  //                                     .toString();
                  //                               });
                  //                               curNum = "";
                  //                               _editingCurNumController
                  //                                   .clear();
                  //                             }
                  //                             Get.snackbar(
                  //                                 value.data["msg"].toString(),
                  //                                 widget.bookName);
                  //                           }
                  //                         });
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //               const SizedBox(
                  //                 height: 10,
                  //               ),
                  //               Row(
                  //                 children: [
                  //                   Text("可借数量:$mAvailableNumber"),
                  //                   const SizedBox(
                  //                     width: 10,
                  //                   ),
                  //                   ElevatedButton(
                  //                     child: const Text("归还"),
                  //                     onPressed: () {
                  //                       if (curTextCheck(curNum)) {
                  //                         BookApi.returnBook(widget.bookIsbn,
                  //                                 curNum, widget.token)
                  //                             .then((value) {
                  //                           if (value.data != null) {
                  //                             if (value.data["code"] == 200) {
                  //                               widget.fieldValue("");
                  //                               setState(() {
                  //                                 mAvailableNumber = (int.parse(
                  //                                             mAvailableNumber) +
                  //                                         int.parse(curNum))
                  //                                     .toString();
                  //                               });
                  //                               curNum = "";
                  //                               _editingCurNumController
                  //                                   .clear();
                  //                             }
                  //                             Get.snackbar(
                  //                                 value.data["msg"].toString(),
                  //                                 widget.bookName);
                  //                           }
                  //                         });
                  //                       }
                  //                     },
                  //                   ),
                  //                   const SizedBox(
                  //                     width: 10,
                  //                   ),
                  //                   ElevatedButton(
                  //                     child: const Text("借出"),
                  //                     onPressed: () {
                  //                       if (curTextCheck(curNum)) {
                  //                         BookApi.rentBook(widget.bookIsbn,
                  //                                 curNum, widget.token)
                  //                             .then((value) {
                  //                           debugPrint(value.data.toString());
                  //                           if (value.data != null) {
                  //                             if (value.data["code"] == 200) {
                  //                               widget.fieldValue("");
                  //                               setState(() {
                  //                                 mAvailableNumber = (int.parse(
                  //                                             mAvailableNumber) -
                  //                                         int.parse(curNum))
                  //                                     .toString();
                  //                               });
                  //                               curNum = "";
                  //                               _editingCurNumController
                  //                                   .clear();
                  //                             }
                  //                             Get.snackbar(
                  //                                 value.data["msg"].toString(),
                  //                                 widget.bookName);
                  //                           }
                  //                         });
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //               const SizedBox(
                  //                 height: 10,
                  //               ),
                  //               ElevatedButton(
                  //                   style: ButtonStyle(
                  //                       backgroundColor:
                  //                           MaterialStateProperty.all(
                  //                               Colors.red)),
                  //                   onPressed: () {

                  //                     Get.defaultDialog(
                  //                       title: "确认要删除这本书吗",
                  //                       middleText: "点击框外返回",
                  //                       confirm: ElevatedButton(
                  //                           style: ButtonStyle(
                  //                               backgroundColor:
                  //                                   MaterialStateProperty.all(
                  //                                       Colors.red)),
                  //                           onPressed: () {
                  //                             BookApi.deleteBook(
                  //                                     widget.bookIsbn,
                  //                                     widget.token)
                  //                                 .then((value) {
                  //                               if (value.data != null) {
                  //                                 debugPrint(
                  //                                     value.data.toString());
                  //                                 Get.snackbar(
                  //                                     value.data["msg"]
                  //                                         .toString(),
                  //                                     widget.bookName);
                  //                                 widget.fieldValue("");
                  //                               }
                  //                             });
                  //                           },
                  //                           child: const Text(
                  //                             "删除书目",
                  //                             style: TextStyle(
                  //                               color: Colors.white,
                  //                             ),
                  //                           )),
                  //                       // onConfirm: () {
                  //                       //   BookApi.deleteBook(
                  //                       //           widget.bookIsbn, widget.token)
                  //                       //       .then((value) {
                  //                       //     if (value.data != null) {
                  //                       //       debugPrint(value.data.toString());
                  //                       //       Get.snackbar(
                  //                       //           value.data["msg"].toString(),
                  //                       //           widget.bookName);
                  //                       //       widget.fieldValue("");
                  //                       //     }
                  //                       //   });
                  //                       // }
                  //                     );
                  //                   },
                  //                   child: const Text(
                  //                     "删除书目",
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                     ),
                  //                   )),
                  //             ],
                  //           ));
                  //     }));
                },
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Detail',
                      ),
                    ]),
              ),
            )

            // container
          ],
        ),
      ),
    );
  }
}
