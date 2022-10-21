import 'package:flutter/material.dart';
import 'package:graduation_project/components/CommonWidgets/HorizontalList.dart';

class PreviewList extends StatelessWidget {
  const PreviewList({super.key, required this.titile, required this.children});
  final String titile;
  final List<Widget> children;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(titile, style: optionStyle),
      HorizontalList(
        children: children,
      )
    ]);
  }
}
