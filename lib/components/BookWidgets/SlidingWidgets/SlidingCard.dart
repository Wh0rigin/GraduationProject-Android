import 'package:flutter/material.dart';
import 'package:graduation_project/po/BookInfo.dart';
import 'dart:math' as math;

class SlidingCard extends StatelessWidget {
  const SlidingCard(
      {super.key,
      required this.bookInfo,
      required this.offset,
      required this.pageChage});
  final ValueChanged<int> pageChage;
  final BookInfo bookInfo;
  final double offset;

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow(offset.abs() - 0.5, 2) / 0.08));
    return SizedBox(
      width: 250,
      height: 500,
      child: Transform.translate(
          offset: Offset(-32 * gauss * offset.sign, 0),
          child: Card(
            margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(32)),
                  child: Image.asset(
                    bookInfo.poster,
                    // height: MediaQuery.of(context).size.height * 0.35,
                    alignment: Alignment(-offset.abs(), 0),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookInfo.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Isbn:${bookInfo.isbn}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        bookInfo.intro,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all(Colors.black),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: const Text(
                          "前往借阅",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          // func change nav
                          pageChage(1);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
