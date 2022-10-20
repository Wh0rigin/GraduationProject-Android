import 'package:flutter/material.dart';
import 'package:graduation_project/common/assets.dart';

import 'package:graduation_project/components/CommonWidgets/ImagePreview/ImageCard.dart';
import 'package:graduation_project/components/CommonWidgets/ImagePreview/PreviewList.dart';

import 'package:graduation_project/components/CommonWidgets/RollTextCard.dart';
import 'package:graduation_project/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.name});

  final String name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Utils.stringToColor("fcf7ea"),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: RollTextCard(
                        height: 75,
                        textList: ['你好,用户:\n${widget.name}', '想要来畅游书本的海洋吗'],
                      )),
                ],
              ),
              const PreviewList(
                titile: '馆内环境',
                children: [
                  ImageCard(imgAsset: AssetsImages.i1367107945Png),
                  ImageCard(imgAsset: AssetsImages.i1367107945Png),
                  ImageCard(imgAsset: AssetsImages.i1367107945Png)
                ],
              ),
            ],
          ),
        ));
  }
}
