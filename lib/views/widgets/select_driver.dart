import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/model/driver_model/driver_model.dart';

void showDriverSelectionDialog(BuildContext context, List<DriverModel> drivers,
    Function(DriverModel) onDriverSelected) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select a Driver'),
        content: Container(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: drivers.length,
            itemBuilder: (context, index) {
              DriverModel driver = drivers[index];
              return ListTile(
                title: Text(driver.name),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  onDriverSelected(
                      driver); // Callback to handle the selected driver
                },
              );
            },
          ),
        ),
      );
    },
  );
}
