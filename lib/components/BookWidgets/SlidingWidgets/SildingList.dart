import 'package:flutter/material.dart';
import 'package:graduation_project/components/BookWidgets/SlidingWidgets/SlidingCard.dart';
import 'package:graduation_project/po/BookInfo.dart';

class SildingList extends StatefulWidget {
  const SildingList({super.key, required this.bookInfos});

  final List<BookInfo> bookInfos;

  @override
  State<SildingList> createState() => _SildingListState();
}

class _SildingListState extends State<SildingList> {
  List<SlidingCard> cards = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.bookInfos.length; i++) {
      cards.add(SlidingCard(bookInfo: widget.bookInfos[i], offset: 200));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }
}
