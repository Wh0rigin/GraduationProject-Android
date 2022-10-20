import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.imgAsset});
  final String imgAsset;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        width: 150,
        height: 200,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(imgAsset))),
      ),
    );
  }
}
