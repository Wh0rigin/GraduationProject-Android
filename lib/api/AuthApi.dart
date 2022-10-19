import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../config/Configs.dart';

class AuthApi {
  static Future<Response> authLogin(String account, String password) async {
    Response response;
    var formData = FormData.fromMap({
      'account': account,
      'password': password,
    });
    debugPrint("Post->http://${Configs.host}:${Configs.port}/api/auth/login");
    response = await Dio().post(
        'http://${Configs.host}:${Configs.port}/api/auth/login',
        data: formData);

    return response;
  }

  static Future<Response> authRegister(
      String telephone, String password) async {
    Response response;
    var formData = FormData.fromMap({
      'name': telephone,
      'telephone': telephone,
      'password': password,
    });
    debugPrint(
        "Post->http://${Configs.host}:${Configs.port}/api/auth/register");
    response = await Dio().post(
        'http://${Configs.host}:${Configs.port}/api/auth/register',
        data: formData);

    return response;
  }
}
