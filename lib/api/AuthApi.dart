import 'package:dio/dio.dart';

import '../config/Configs.dart';

class AuthApi {
  static Future<Response> authLogin(String account, String password) async {
    Response response;
    var formData = FormData.fromMap({
      'account': account,
      'password': password,
    });
    print("Post->http://${Configs.host}:${Configs.port}/api/auth/login");
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
    print("Post->http://${Configs.host}:${Configs.port}/api/auth/register");
    response = await Dio().post(
        'http://${Configs.host}:${Configs.port}/api/auth/register',
        data: formData);

    return response;
  }

  static void getHttp() async {
    try {
      Response response = await Dio().get("http://www.baidu.com");
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
