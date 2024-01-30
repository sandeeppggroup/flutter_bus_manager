import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';
import 'package:flutter_bus_manager/widget/custom_buttons.dart';
import 'package:flutter_bus_manager/widget/company_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mainColorLight,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CompanyLogo(
                  fontSize: 60,
                )
              ],
            ),
          ),
          Column(
            children: [
              CustomButtons(
                label: "Get Started",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login_screen');
                },
                buttonColor: Colors.white,
                labelColor: mainColorLight,
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          )
        ],
      ),
    );
  }
}
