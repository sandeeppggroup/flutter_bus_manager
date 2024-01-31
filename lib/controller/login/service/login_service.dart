import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bus_manager/core/api/base_url.dart';
import 'package:flutter_bus_manager/core/api/end_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  String loginUrl = BaseUrl().baseUrl + EndUrl().loginUser;
  Dio dio = Dio();

  Future<dynamic> userLoginService(String userName, String password) async {
    try {
      Response response = await dio.post(
        loginUrl,
        data: {
          "username": userName,
          "password": password,
        },
      );
      log("Response: ${response.statusCode}");

      if (response.statusCode == 200) {
        // log('Login Data: ${response.data}');
        dynamic status = response.data;
        // String token = response.data['access'];
        // String key = response.data['url_id'];
        // log('Token : $token, key : $key');
        // log('Status : $status');
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('token', token);
        // prefs.setString('key', key);
        return status;
      } else {
        log('Login Data erron: ${response.data}');
      }
    } catch (e) {
      log('Login Data erron catch: $e');
      return null;
    }
    return null;
  }
}
