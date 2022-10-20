import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({super.key, required this.children});
  final List<Widget> children;
  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      // child: ,
      child:
          ListView(scrollDirection: Axis.horizontal, children: widget.children),
    );
  }
}
