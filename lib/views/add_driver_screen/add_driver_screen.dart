import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/controller/driver_list/provider/driver_list_provider.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';
import 'package:flutter_bus_manager/views/widgets/custom_appbar_second.dart';
import 'package:flutter_bus_manager/views/widgets/custom_buttons.dart';
import 'package:flutter_bus_manager/views/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddDriverScreen extends StatelessWidget {
  const AddDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    DriverProvider driverProvider =
        Provider.of<DriverProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          const CustomAppbarSecond(
            title: Text(
              'Add Driver',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          CustomTextField(
              controller: driverProvider.nameController, label: 'Enter Name'),
          SizedBox(
            height: height * 0.03,
          ),
          CustomTextField(
              controller: driverProvider.mobileNumberController,
              label: 'Enter Mobile Number'),
          SizedBox(
            height: height * 0.03,
          ),
          CustomTextField(
              controller: driverProvider.licenseController,
              label: 'Enter License Number'),
          SizedBox(
            height: height * 0.4,
          ),
          CustomButtons(
              label: 'Save',
              labelColor: Colors.white,
              onPressed: () {},
              buttonColor: mainColorLight),
        ],
      ),
    );
  }
}
