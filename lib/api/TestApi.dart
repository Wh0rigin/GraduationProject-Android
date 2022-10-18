import 'package:dio/dio.dart';

class TestApi {
  static Future<Response> gettest() async {
    Response response =
        await Dio().get("http://172.20.21.97:8080/api/get/test");
    return response;
  }

  static Future<Response> posttest200() async {
    Response response =
        await Dio().post("http://172.20.21.97:8080/api/post/test200");
    return response;
  }

  static Future<Response> posttest422(String ass) async {
    Response response = await Dio().post(
        "http://172.20.21.97:8080/api/post/test422",
        data: {"account": ass});
    return response;
  }
}
