import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bus_manager/core/api/base_url.dart';
import 'package:flutter_bus_manager/core/api/end_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverService {
  String getDriverListUrl = BaseUrl().baseUrl + EndUrl().getDriverList;
  Dio dio = Dio();

  Future fetchAllDriver() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = prefs.getString('key');
    log("Key from shrdprc : $key");
    final token = prefs.getString('token');
    log("token from shrdprc : $token");

    try {
      Response response = await dio.get(getDriverListUrl);
    } catch (e) {}
  }
}
