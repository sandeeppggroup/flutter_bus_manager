import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/controller/bus_list/service/bus_list_service.dart';
import 'package:flutter_bus_manager/model/bus_model/bus_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BusListProvider extends ChangeNotifier {
  BusService busService = BusService();
  List<BusModel> _busList = [];

  List<BusModel> get busList => _busList;

  Future<void> fetchBusList() async {
    dynamic reslut = await busService.getBusList();
    if (reslut != null) {
      _busList = reslut;
      // log('BusList provider: ${_busList.toList().toString()}');
    } else {
      Fluttertoast.showToast(
        msg:
            'Oops! Something went wrong.  \nplease check your network connection',
        backgroundColor: Colors.blue,
        toastLength: Toast.LENGTH_LONG,
        fontSize: 15,
      );
      _busList = [];
      notifyListeners();
      return;
    }
    notifyListeners();
  }
}
