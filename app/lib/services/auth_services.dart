import 'package:app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthenticationServices {
  Dio dio = Dio();
  String apiUrl = "${AppConstants().url}/auth";

  login(String email, String password) async {
    try {
      return (await dio.post(
        '$apiUrl/login',
        data: {
          'email': email,
          'password': password,
        },
        // options: Options(contentType: Headers.formUrlEncodedContentType),
      ));
    } on DioError catch (e) {
      Fluttertoast.showToast(
        // msg: e.response?.data['Message'],
        msg: 'Login Error',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red[900],
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  register(String email, String password, String name) async {
    try {
      return (await dio.post(
        '$apiUrl/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
        // options: Options(contentType: Headers.formUrlEncodedContentType),
      ));
    } on DioError catch (e) {
      print(e);
    }
  }

}
