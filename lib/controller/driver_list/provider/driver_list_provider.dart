// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/controller/driver_list/service/driver_service.dart';
import 'package:flutter_bus_manager/model/driver_model/driver_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  Future<void> addDriver(BuildContext context) async {
    if (nameController.text.isEmpty ||
        licenseController.text.isEmpty ||
        mobileNumberController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter all the fields');
      return;
    }
    final result = await driverService.addDriver(nameController.text,
        mobileNumberController.text, licenseController.text);
    if (result == true) {
      Fluttertoast.showToast(msg: 'Driver added successfully');

      await getDriverList();

      nameController.clear();
      mobileNumberController.clear();
      licenseController.clear();

      Navigator.pop(context);
    } else {
      Fluttertoast.showToast(msg: 'Something is wrong');
    }
  }

  Future<bool> deleteDriver(String id) async {
    final result = await driverService.deleteDriverService(id);
    return result;
  }

  Future<void> deleteDriverPopUp(BuildContext context, String driverId) async {
    bool confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this driver?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmDelete == true) {
      // Perform the delete operation
      bool result = await deleteDriver(driverId);

      if (result == true) {
        Fluttertoast.showToast(msg: 'Driver deleted successfully');
        _driverList.clear();
        await getDriverList();
      } else {
        Fluttertoast.showToast(msg: 'Something went wrong');
      }
    }
  }
}
