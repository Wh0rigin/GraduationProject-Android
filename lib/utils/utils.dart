import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

class Utils {
  static bool isNumeric(String s) {
    if (double.tryParse(s) == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<Map> readConfig() async {
    String content = "";
    File file = File('../config/config.yaml');

    try {
      content = await file.readAsString();
    } catch (e) {
      print(e);
    }
    var doc = loadYaml(content);

    return {"host": doc["host"], "port": doc["port"]};
  }

  static Color stringToColor(String source) {
    return Color(int.parse(source, radix: 16) | 0xFF000000);
  }

  static MaterialColor stringToMaterialColor(String source) {
    Color color = stringToColor(source);

    List<double> strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
