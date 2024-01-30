import 'package:flutter/material.dart';

class BusDriverContainer extends StatelessWidget {
  final String tittle;
  final String discription;
  final Widget image;
  final Color backgroundColor;
  const BusDriverContainer(
      {required this.tittle,
      required this.discription,
      required this.image,
      required this.backgroundColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: height * 0.25,
          width: width * 0.4,
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tittle,
                  style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  discription,
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 30,
          child: SizedBox(
            height: height * 0.17,
            child: image,
          ),
        )
      ],
    );
  }
}
