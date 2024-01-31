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

  Future addDriver(String name, String mobile, String licenseNo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      Response response = await dio.post(
        driverApi,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: FormData.fromMap(
          {
            "license_no": licenseNo,
            "mobile": mobile,
            "name": name,
          },
        ),
      );

      log("Status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        log('Status : ${response.data['status']}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Catch error : $e');
      return false;
    }
  }

  Future<bool> deleteDriverService(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      Response response = await dio.delete(
        driverApi,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: FormData.fromMap(
          {
            "driver_id": id,
          },
        ),
      );
      log("Status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        log('Status : ${response.data['status']}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
