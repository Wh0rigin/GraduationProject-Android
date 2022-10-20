import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class RollTextCardBox extends StatefulWidget {
  const RollTextCardBox(
      {super.key,
      required this.width,
      required this.height,
      required this.textList});
  final List<String> textList;
  final double width;
  final double height;
  @override
  State<RollTextCardBox> createState() => _RollTextCardBoxState();
}

class _RollTextCardBoxState extends State<RollTextCardBox> {
  List<AnimatedText> anims = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.textList.length; i++) {
      anims.add(RotateAnimatedText(
        widget.textList[i],
        textStyle: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: AnimatedTextKit(
          animatedTexts: anims,
          repeatForever: true,
        ),
      ),
    ));
  }
}
