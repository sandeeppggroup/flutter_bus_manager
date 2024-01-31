import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/controller/driver_list/provider/driver_list_provider.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';
import 'package:flutter_bus_manager/model/driver_model/driver_model.dart';
import 'package:provider/provider.dart';

class DriverListWidget extends StatelessWidget {
  const DriverListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Consumer<DriverProvider>(builder: (context, value, child) {
      List<DriverModel> driverList = value.driverList;
      return ListView.builder(
        itemCount: driverList.length,
        itemBuilder: (context, index) {
          DriverModel driver = driverList[index];
          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 70, // Adjust the width as needed
                child: SizedBox(
                  height: height * 0.1,
                  child: Image.asset('assets/images/driver.png'),
                ),
              ),
              title: Text(driver.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)),
              subtitle:
                  Text(driver.licenseNo, style: const TextStyle(fontSize: 12)),
              trailing: SizedBox(
                height: 35,
                width: 85,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColorLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    String id = driver.id.toString();
                    Provider.of<DriverProvider>(context, listen: false)
                        .deleteDriverPopUp(context, id);
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
