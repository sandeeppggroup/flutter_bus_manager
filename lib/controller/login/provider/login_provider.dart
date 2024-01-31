// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/controller/login/service/login_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  LoginService loginService = LoginService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future userLogin(BuildContext context) async {
    final result = await loginService.userLoginService(
        usernameController.text.trim(), passwordController.text.trim());
    log("result : ${result.toString()}");
    if (result['status'] == true) {
      String token = result['access'];
      String key = result['url_id'];
      log('Token : $token, key : $key');

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setString('key', key);
      Fluttertoast.showToast(
          msg: 'Successfully logged in',
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.green);
      Navigator.pushNamedAndRemoveUntil(
          context, '/bus_list_screen', (route) => false);
    } else if (result == false) {
      Fluttertoast.showToast(
          msg: 'Wrong username or password',
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.pink);
      return;
    } else {
      Fluttertoast.showToast(
          msg: 'Something is wrong',
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.pink);
    }
  }
}
