import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../config/Configs.dart';

class ActuatorApi {
  static Future<Response> ControlActuator(
      String name, String status, String token) async {
    Response response;
    var formData = FormData.fromMap({
      'name': name,
      'status': status,
    });
    debugPrint(
        "Post->http://${Configs.host}:${Configs.port}/api/actuator/control");
    response = await Dio()
        .post('http://${Configs.host}:${Configs.port}/api/actuator/control',
            data: formData,
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }));

    return response;
  }
}
