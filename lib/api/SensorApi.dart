import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../config/Configs.dart';

class SensorApi {
  static Future<Response> getLaterSensorData(
      String sensorType, String token) async {
    debugPrint(
        "Get->http://${Configs.host}:${Configs.port}/api/sensor/recent/$sensorType/1");
    Response response;
    response = await Dio().get(
        "http://${Configs.host}:${Configs.port}/api/sensor/recent/$sensorType/1",
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    return response;
  }
}
