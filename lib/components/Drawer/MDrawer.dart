import 'package:flutter/material.dart';
import 'package:graduation_project/components/Drawer/MenuDrawer.dart';

import '../../common/assets.dart';

class MDrawer extends StatefulWidget {
  const MDrawer({super.key, required this.telephone});
  final String telephone;
  @override
  State<MDrawer> createState() => _MDrawerState();
}

class _MDrawerState extends State<MDrawer> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.0, 1.0],
                      colors: [Colors.orange, Colors.yellow])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100 / 2)),
                      ),
                      Image.asset(
                        AssetsImages.i1367107945Png,
                        width: 75,
                        height: 75,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.telephone,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              )),
          const MenuDrawer(),
        ],
      ),
    );
  }
}
