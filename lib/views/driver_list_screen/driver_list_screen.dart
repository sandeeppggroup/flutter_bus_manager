import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/controller/driver_list/provider/driver_list_provider.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';
import 'package:flutter_bus_manager/views/driver_list_screen/widgets/driver_list.dart';
import 'package:flutter_bus_manager/views/widgets/custom_appbar_second.dart';
import 'package:flutter_bus_manager/views/widgets/custom_buttons.dart';
import 'package:provider/provider.dart';

class DriverListScreen extends StatelessWidget {
  const DriverListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider.of<DriverProvider>(context, listen: false).getDriverList();
    // final driverProvider = context.watch<DriverProvider>();

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
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15),
            child: Consumer<DriverProvider>(
              builder: (context, value, child) => Text(
                '${value.driverList.length} Drivers Found',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: DriverListWidget(),
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
