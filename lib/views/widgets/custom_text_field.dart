// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  String label;
  CustomTextField({required this.controller, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.07,
      width: width * 0.8,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: textFieldBackground),
        child: TextFormField(
          keyboardType: TextInputType.name,
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            label: Center(child: Text(label)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
