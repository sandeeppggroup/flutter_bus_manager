import 'package:flutter/material.dart';

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
              left:
                  BorderSide(color: Colors.red, width: 8.0), // Adjust the width
              right:
                  BorderSide(color: Colors.red, width: 8.0), // Adjust the width
              bottom: BorderSide(color: Colors.red, width: 10.0),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            color: Colors.red,
            margin: const EdgeInsets.all(5), // Add margin for the gap
            child: child,
          ),
        ),
      ],
    );
  }
}
