import 'package:flutter/material.dart';

class DriverProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController licenseController = TextEditingController();

  Future getDriverList() async {}
}
