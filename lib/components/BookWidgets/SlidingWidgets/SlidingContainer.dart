import 'package:flutter/material.dart';
import 'package:graduation_project/components/BookWidgets/SlidingWidgets/SlidingCard.dart';
import 'package:graduation_project/po/BookInfo.dart';

class SlidingContainer extends StatefulWidget {
  const SlidingContainer({super.key, required this.bookInfos});
  final List<BookInfo> bookInfos;

  @override
  State<SlidingContainer> createState() => _SlidingContainerState();
}

class _SlidingContainerState extends State<SlidingContainer> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.84);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page!);
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView(
        controller: pageController,
        children: List.generate(widget.bookInfos.length, (index) {
          return SizedBox(
            width: 50,
            child: SlidingCard(
                pageChage: (value) {},
                bookInfo: widget.bookInfos[index],
                offset: pageOffset - index),
          );
        }),
      ),
    );
  }
}
