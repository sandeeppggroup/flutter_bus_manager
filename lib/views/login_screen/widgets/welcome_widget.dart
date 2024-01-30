import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          children: [
            Stack(
              children: [
                Container(
                  child: Container(
                    width: width * 1,
                    height: height * 0.35,
                    color: mainColorDark,
                  ),
                ),
                Positioned(
                  bottom: 68,
                  left: 140,
                  child: Transform.rotate(
                    angle: 1,
                    child: Container(
                      width: 330,
                      height: 310,
                      color: mainColorLight,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: height * 0.17,
              left: width * 0.1,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Manage your Bus and Drivers',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
