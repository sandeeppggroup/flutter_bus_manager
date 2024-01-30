import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';
import 'package:flutter_bus_manager/views/seat_layout_screen_2_2/widgets/u_shaped_container.dart';
import 'package:flutter_bus_manager/views/widgets/custom_appbar_second.dart';

class SeatLayoutFirst extends StatelessWidget {
  const SeatLayoutFirst({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppbarSecond(
              title: Text(
                'KSRTC Swift Scania P-series',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Stack(
              children: [
                Container(
                  height: height * 0.16,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      color: mainColorDark,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Padding(
                    padding: EdgeInsets.all(23.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rohit Sharma',
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'License no : pj08iu5325323564',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        )
                      ],
                    ),
                  ),
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
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 241.0),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildSeatsColumn(18, true),
                        buildSeatsColumn(18, false),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSeatsColumn(int totalSeats, bool isLeft) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSeats ~/ 2,
        (rowIndex) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            2,
            (seatIndex) {
              final seatNumber = rowIndex * 4 + seatIndex + (isLeft ? 1 : 3);
              return Container(
                height: 40,
                width: 45,
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
        ),
      ),
    );
  }
}
