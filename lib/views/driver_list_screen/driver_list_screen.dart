import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';
import 'package:flutter_bus_manager/views/driver_list_screen/widgets/driver_list.dart';
import 'package:flutter_bus_manager/views/widgets/custom_appbar_second.dart';
import 'package:flutter_bus_manager/views/widgets/custom_buttons.dart';

class DriverListScreen extends StatelessWidget {
  const DriverListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppbarSecond(
            title: Text(
              'Driver List',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 15),
            child: Text(
              '21 Drivers Found',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const DriverListWidget();
                },
              ),
            ),
          ),
          Center(
            child: CustomButtons(
                label: 'Add Driver',
                labelColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/add_driver_screen');
                },
                buttonColor: mainColorLight),
          ),
        ],
      ),
    );
  }
}
