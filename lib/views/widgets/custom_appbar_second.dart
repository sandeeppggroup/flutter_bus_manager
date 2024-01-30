import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';

class CustomAppbarSecond extends StatelessWidget {
  final Widget title;
  final Widget? leading;
  const CustomAppbarSecond({required this.title, this.leading, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainColorDark,
      title: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: title,
      ),
      centerTitle: false,
      toolbarHeight: 90,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
