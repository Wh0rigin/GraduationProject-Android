import 'package:flutter/material.dart';
import 'package:graduation_project/components/CommonWidgets/HorizontalList.dart';

class PreviewList extends StatelessWidget {
  const PreviewList({super.key, required this.titile, required this.children});
  final String titile;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        titile,
        style: const TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      HorizontalList(
        children: children,
      )
    ]);
  }
}
