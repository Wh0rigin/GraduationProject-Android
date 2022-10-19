import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../config/Configs.dart';

class BookApi {
  static Future<Response> getBookByIsbn(String isbn, String token) async {
    debugPrint(
        "Get->http://${Configs.host}:${Configs.port}/api/book/select/isbn/$isbn");
    Response response;
    response = await Dio().get(
        "http://${Configs.host}:${Configs.port}/api/book/select/isbn/$isbn",
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    return response;
  }
}
