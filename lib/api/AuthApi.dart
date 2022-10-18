import 'package:dio/dio.dart';

class AuthApi {
  static Future<Response> authLogin(String account, String password) async {
    Response response;
    var formData = FormData.fromMap({
      'account': account,
      'password': password,
    });
    response = await Dio()
        .post('http://172.20.21.97:8080/api/auth/login', data: formData);
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
