// ignore_for_file: prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/controller/driver_list/provider/driver_list_provider.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';
import 'package:flutter_bus_manager/model/driver_model/driver_model.dart';
import 'package:flutter_bus_manager/views/widgets/custom_appbar_second.dart';
import 'package:flutter_bus_manager/views/widgets/select_driver.dart';
import 'package:provider/provider.dart';

class SeatLayoutSecond extends StatelessWidget {
  final busName;
  const SeatLayoutSecond({required this.busName, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppbarSecond(
              title: Text(
                busName,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Stack(
              children: [
                Consumer<DriverProvider>(
                  builder: (context, value, child) {
                    List<DriverModel> drivers = value.driverList;
                    return InkWell(
                      onTap: () {
                        showDriverSelectionDialog(context, drivers,
                            (selectedDriver) {
                          value.nameController.text = selectedDriver.name;
                          value.licenseController.text =
                              selectedDriver.licenseNo;
                        });
                      },
                      child: Container(
                        height: height * 0.16,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                            color: mainColorDark,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(23.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                value.nameController.text,
                                style: const TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'License no : ${value.licenseController.text}',
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 235,
                  child: SizedBox(
                    height: height * 0.17,
                    child: Image.asset('assets/images/driver1.png'),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 240.0),
                          child: Container(
                            height: 40,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                'D',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildSingleSeat(), // Single seat on the left
                        const SizedBox(width: 8),
                        buildSeatsRow(3, startingSeat: 1), // 1 * 3 layout
                      ],
                    ),
                    buildMultipleColumns(8, 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSingleSeat() {
    return Container(
      height: 40,
      width: 45,
      margin: const EdgeInsets.only(left: 30, right: 60),
      child: const UShapedContainer(
        child: Center(
          child: Text(
            '1',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildSeatsRow(int totalSeats, {required int startingSeat}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        totalSeats,
        (seatIndex) {
          final seatNumber = startingSeat + seatIndex;
          return Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(4),
            child: UShapedContainer(
              child: Center(
                child: Text(
                  seatNumber.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildMultipleColumns(int totalColumns, int seatsPerColumn) {
    List<Widget> columns = [];

    int startingSeat =
        4; // Change this to the last seat number in the previous row

    for (int i = 0; i < totalColumns; i++) {
      columns.add(
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildSingleSeat(), // Single seat on the left
                const SizedBox(width: 8),
                buildSeatsRow(seatsPerColumn, startingSeat: startingSeat),
              ],
            ),
          ],
        ),
      );
      startingSeat += seatsPerColumn;
    }

    return Column(
      children: columns,
    );
  }
}

class UShapedContainer extends StatelessWidget {
  final Widget child;

  const UShapedContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: const Border(
              left: BorderSide(color: Colors.red, width: 8.0),
              right: BorderSide(color: Colors.red, width: 8.0),
              bottom: BorderSide(color: Colors.red, width: 10.0),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            color: Colors.red,
            margin: const EdgeInsets.all(5),
            child: child,
          ),
        ),
      ],
    );
  }
}
