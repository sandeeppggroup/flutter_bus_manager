import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bus_manager/core/api/base_url.dart';
import 'package:flutter_bus_manager/core/api/end_url.dart';
import 'package:flutter_bus_manager/model/driver_model/driver_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverService {
  String driverApi = BaseUrl().baseUrl + EndUrl().getDriverList;
  Dio dio = Dio();

  Future<List<DriverModel>?> fetchAllDriver() async {
    log("Driver List Api Full Url: $driverApi");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    log("token from shrdprc : $token");

    try {
      Response response = await dio.get(
        driverApi,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      log('Response : ${response.statusCode}');

      if (response.statusCode == 200) {
        log('driver List : ${response.data}');
        List<dynamic> driverJsonList = response.data['drivers'];
        List<DriverModel> driverList = driverJsonList
            .map((driverItems) => DriverModel.fromJson(driverItems))
            .toList();
        log("Driver List service : ${driverList.toString()}");
        return driverList;
      } else {
        return null;
      }
    } catch (e) {
      log('Error in catch: $e');
      return null;
    }
  }
}
