import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';

class CardListTile extends StatelessWidget {
  const CardListTile({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 70, // Adjust the width as needed
          child: SizedBox(
            height: height * 0.1,
            child: Image.asset('assets/images/bus_scania.png'),
          ),
        ),
        title: const Text('KSRTC',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        subtitle:
            const Text('Swift Scania P-series', style: TextStyle(fontSize: 12)),
        trailing: SizedBox(
          height: 35,
          width: 85,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: mainColorLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Manage',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
