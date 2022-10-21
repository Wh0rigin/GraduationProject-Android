import 'package:flutter/material.dart';
import 'package:graduation_project/components/BookWidgets/SlidingWidgets/SlidingCard.dart';
import 'package:graduation_project/po/BookInfo.dart';

class SildingList extends StatefulWidget {
  const SildingList(
      {super.key, required this.bookInfos, required this.pageChage});

  final List<BookInfo> bookInfos;
  final ValueChanged<int> pageChage;

  @override
  State<SildingList> createState() => _SildingListState();
}

class _SildingListState extends State<SildingList> {
  List<SlidingCard> cards = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.bookInfos.length; i++) {
      cards.add(SlidingCard(
          pageChage: widget.pageChage,
          bookInfo: widget.bookInfos[i],
          offset: 200));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.68,
      height: 520,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }
}
