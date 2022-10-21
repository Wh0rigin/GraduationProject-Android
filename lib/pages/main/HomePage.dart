import 'package:flutter/material.dart';
import 'package:graduation_project/common/assets.dart';
import 'package:graduation_project/components/BookWidgets/SlidingWidgets/SildingList.dart';

import 'package:graduation_project/components/CommonWidgets/ImagePreview/ImageCard.dart';
import 'package:graduation_project/components/CommonWidgets/ImagePreview/PreviewList.dart';

import 'package:graduation_project/components/CommonWidgets/RollTextCard.dart';
import 'package:graduation_project/po/BookInfo.dart';
import 'package:graduation_project/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.name, required this.pageChage});

  final String name;
  final ValueChanged<int> pageChage;

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
        body: ListView(
          children: [
            Padding(
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
                      ImageCard(imgAsset: AssetsImages.library1),
                      ImageCard(imgAsset: AssetsImages.library2),
                      ImageCard(imgAsset: AssetsImages.library3),
                      ImageCard(imgAsset: AssetsImages.library4),
                      ImageCard(imgAsset: AssetsImages.library5),
                      ImageCard(imgAsset: AssetsImages.library6),
                      ImageCard(imgAsset: AssetsImages.library7),
                      ImageCard(imgAsset: AssetsImages.library8),
                      ImageCard(imgAsset: AssetsImages.library9),
                      ImageCard(imgAsset: AssetsImages.library10),
                      ImageCard(imgAsset: AssetsImages.library11),
                      ImageCard(imgAsset: AssetsImages.library12),
                      ImageCard(imgAsset: AssetsImages.library13),
                    ],
                  ),
                  const Text(
                    '热门书目',
                    style: optionStyle,
                  ),
                  SildingList(pageChage: widget.pageChage, bookInfos: const [
                    BookInfo(
                        name: '高等数学',
                        isbn: '1',
                        poster: AssetsImages.math,
                        intro:
                            '《高等数学（第七版）》分上、下两册出版，共十二章，上册包括函数与极限、导数与微分、微分中值定理与导数的应用、不定积分、定积分及其应用、微分方程等内容，书末附有二阶和三阶行列式简介、基本初等函数的图形、几种常用的曲线、积分表、习题答案与提示；下册包括向量代数与空间解析几何、多元函数微分法及其应用、重积分、曲线积分与曲面积分、无穷级数等内容，书末附有习题答案与提示'),
                    BookInfo(
                        name: '素晴日',
                        isbn: '132456654',
                        poster: AssetsImages.yuki,
                        intro:
                            '六个视点，一个故事，多种旋律。各个视点组成了故事。然后故事编绘出旋律。「天空与世界」「终结与开始」「文学与化学」「救世主与英雄」「兄与妹」「向日葵的坡道旋律变成了共鸣的乐章。这就是名为『素晴らしき日々』的故事。'),
                    BookInfo(
                        name: '新概念英语',
                        isbn: '595519816561',
                        poster: AssetsImages.english,
                        intro:
                            '《新概念英语》经典教材通过完整的英语学习体系，帮助学生掌握英语的4项基本技能——听、说、读、写，使学生能在学习中最大限度地发挥自己的潜能。'),
                    BookInfo(
                        name: 'ROS机器人编程',
                        isbn: '5235325',
                        poster: AssetsImages.ros,
                        intro:
                            '仅使用C++，深入解析ROS底层原理，涉及领域系统全面。除了系统讲解ROS的内部的工作机制外，还着重介绍了移动机器人与机械臂的基本原理，附有大量示例代码'),
                    BookInfo(
                        name: '现代操作系统',
                        isbn: '83778686',
                        poster: AssetsImages.czxt,
                        intro:
                            '本书是操作系统领域的经典教材，主要内容包括进程与线程、内存管理、文件系统、输入/输出、死锁、虚拟化和云、多处理机系统、安全，以及关于UNIX、Linux、Android和Windows的实例研究等。第4版对知识点进行了全面更新，反映了当代操作系统的发展与动向。本书适合作为高等院校计算机专业的操作系统课程教材，也适合相关技术人员参考。'),
                    BookInfo(
                        name: '深入理解计算机系统',
                        isbn: '35251512',
                        poster: AssetsImages.jsjxt,
                        intro:
                            '解释所有计算机系统的本质概念，并向你展示这些概念是如何实实在在地影响应用程序的正确性、性能和实用性的。其他的系统类书籍都是从构建者的角度来写的，讲述如何实现硬件或系统软件，'),
                    BookInfo(
                        name: 'TCP/IP详解',
                        isbn: '53253212',
                        poster: AssetsImages.tcpip,
                        intro:
                            '讲述TCP/IP协议，结合大量实例讲述TCP/IP协议族的定义原因，以及在各种不同的操作系统中的应用及工作方式。第2版在保留Stevens卓越的知识体系和写作风格的基础上，新加入的作者Kevin R. Fall结合其作为TCP/IP协议研究领域领导者的尖端经验来更新本书，'),
                    BookInfo(
                        name: '计算机网络',
                        isbn: '35142151124',
                        poster: AssetsImages.jsjwl,
                        intro:
                            '本书是经典的计算机网络教材之一，采用了作者的自顶向下方法来讲授计算机网络的原理及其协议，自16年前第1版出版以来已经被数百所大学和学院选作教材，被译为14种语言。第7版保持了以前版本的特色，继续关注因特网和计算机网络的现代处'),
                  ])
                ],
              ),
            )
          ],
        ));
  }
}
