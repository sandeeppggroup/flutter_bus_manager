import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bus_manager/core/api/base_url.dart';
import 'package:flutter_bus_manager/core/api/end_url.dart';
import 'package:flutter_bus_manager/model/bus_model/bus_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusService {
  String busListUrl = BaseUrl().baseUrl + EndUrl().getBusList;
  Dio dio = Dio();

  Future<List<BusModel>?> getBusList() async {
    log('BusList Api full Url: $busListUrl');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    log('Token: $token');

    try {
      Response response = await dio.get(
        busListUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      log('response: ${response.statusCode}');

      if (response.statusCode == 200) {
        // log('success : ${response.data}');
        List<dynamic> busJsonList = response.data['bus'];
        List<BusModel> busList =
            busJsonList.map((busItems) => BusModel.fromJson(busItems)).toList();
        // log('BusList in service: ${busList.toList().toString()}');
        return busList;
      } else {
        return null;
      }
    } catch (e) {
      log('Fetch Error: $e');
      return null;
    }
  }
}
