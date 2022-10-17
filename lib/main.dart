// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import "package:flutter/material.dart";
import 'NavStatfulWidget.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String _title = '图书管理系统';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        home: NavStatfulWidget());
  }
}
