import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sktr/views/deshboard_screen.dart';
import 'package:http/http.dart' as http;

final Dio dio = Dio();

class ApiClient {
  //this function is login
  static Future<void> login({
    required String username,
    required String password,
    required Position currentPosition,
    required BuildContext context,
  }) async {
    String loginApi = "http://apps.bigerp24.com/api/login";
    //IMPLEMENT USER LOGIN

    try {
      final FormData formData = FormData.fromMap({
        "username": "${username}",
        "password": "${password}",
      });
      var response = await http.post(
        Uri.parse(loginApi),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            {"username": username.toString(), "password": password.toString()}),
      );
      var data = jsonDecode(response.body);
      print("All api login response=====>>>$response");
      GetStorage().write("token", data["token"]);
      print(
          " tokennnnnnnnnnnnnnnnnnnnnn : ======>  ${GetStorage().read("token")}");
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("token", data["token"]);
      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => DeshBoardScreen(
              currentPosition: currentPosition,
              token: data["token"],
            ),
          ),
        );
        Fluttertoast.showToast(msg: "Login successfull");
      }
    } on DioError catch (e) {
      print("DioError ============> $e");
      Fluttertoast.showToast(msg: "Error => ${e.message}");
      // return e.response!.data;
    }
  }
}
