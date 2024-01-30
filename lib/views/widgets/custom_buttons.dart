// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  String label;
  Color labelColor;
  final VoidCallback onPressed;
  Color buttonColor;
  CustomButtons({
    required this.label,
    required this.labelColor,
    required this.onPressed,
    required this.buttonColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * .07,
      width: width * .8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: labelColor, fontSize: 18),
        ),
      ),
    );
  }
}
