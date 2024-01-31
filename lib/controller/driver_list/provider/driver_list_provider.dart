import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/controller/driver_list/service/driver_service.dart';
import 'package:flutter_bus_manager/model/driver_model/driver_model.dart';

class DriverProvider extends ChangeNotifier {
  DriverService driverService = DriverService();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  List<DriverModel> _driverList = [];

  List<DriverModel> get driverList => _driverList;

  Future getDriverList() async {
    dynamic result = await driverService.fetchAllDriver();

    if (result != null) {
      _driverList = result;
      notifyListeners();
    }
    notifyListeners();
  }
}
