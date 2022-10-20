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

  ///api/book/all
  static Future<Response> getAllBook(String token) async {
    debugPrint("Get->http://${Configs.host}:${Configs.port}/api/book/all");
    Response response;
    response =
        await Dio().get("http://${Configs.host}:${Configs.port}/api/book/all",
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }));
    return response;
  }

  static Future<Response> createBook(String bookName, String bookIsbn,
      String number, String rentNumber, String token) async {
    debugPrint("Post->http://${Configs.host}:${Configs.port}/api/book/create");
    Response response;
    var formData = FormData.fromMap({
      'name': bookName,
      'isbn': bookIsbn,
      'number': number,
      'rentNumber': rentNumber
    });
    response = await Dio()
        .post("http://${Configs.host}:${Configs.port}/api/book/create",
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }),
            data: formData);
    return response;
  }

  static Future<Response> deleteBook(String isbn, String token) async {
    var formData = FormData.fromMap({'isbn': isbn});
    debugPrint(
        "Delete->http://${Configs.host}:${Configs.port}/api/book/delete");
    Response response;
    response = await Dio()
        .delete("http://${Configs.host}:${Configs.port}/api/book/delete",
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }),
            data: formData);
    return response;
  }

  static Future<Response> addBook(
      String isbn, String number, String token) async {
    var formData = FormData.fromMap({'isbn': isbn, 'number': number});
    debugPrint("Post->http://${Configs.host}:${Configs.port}/api/book/add");
    Response response;
    response =
        await Dio().post("http://${Configs.host}:${Configs.port}/api/book/add",
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }),
            data: formData);
    return response;
  }

  static Future<Response> reduceBook(
      String isbn, String number, String token) async {
    var formData = FormData.fromMap({'isbn': isbn, 'number': number});
    debugPrint("Post->http://${Configs.host}:${Configs.port}/api/book/reduce");
    Response response;
    response = await Dio()
        .post("http://${Configs.host}:${Configs.port}/api/book/reduce",
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }),
            data: formData);
    return response;
  }

  static Future<Response> rentBook(
      String isbn, String number, String token) async {
    var formData = FormData.fromMap({'isbn': isbn, 'number': number});
    debugPrint("Post->http://${Configs.host}:${Configs.port}/api/book/rent");
    Response response;
    response =
        await Dio().post("http://${Configs.host}:${Configs.port}/api/book/rent",
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }),
            data: formData);
    return response;
  }

  static Future<Response> returnBook(
      String isbn, String number, String token) async {
    var formData = FormData.fromMap({'isbn': isbn, 'number': number});
    debugPrint("Post->http://${Configs.host}:${Configs.port}/api/book/return");
    Response response;
    response = await Dio()
        .post("http://${Configs.host}:${Configs.port}/api/book/return",
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }),
            data: formData);
    return response;
  }
}
