import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class RollTextCard extends StatefulWidget {
  const RollTextCard({super.key, required this.textList, required this.height});
  final List<String> textList;
  final double height;

  @override
  State<RollTextCard> createState() => _RollTextCardState();
}

class _RollTextCardState extends State<RollTextCard> {
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
        height: widget.height,
        child: AnimatedTextKit(
          animatedTexts: anims,
          repeatForever: true,
        ),
      ),
    ));
  }
}
