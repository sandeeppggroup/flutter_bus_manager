// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';

class CompanyLogo extends StatelessWidget {
  double fontSize;
  CompanyLogo({required this.fontSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'moov',
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'be',
          style: TextStyle(
              color: logoLetterColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
