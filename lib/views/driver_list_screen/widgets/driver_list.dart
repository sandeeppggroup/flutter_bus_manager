import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';

class DriverListWidget extends StatelessWidget {
  const DriverListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 70, // Adjust the width as needed
          child: SizedBox(
            height: height * 0.1,
            child: Image.asset('assets/images/driver.png'),
          ),
        ),
        title: const Text('Rohit sharma',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        subtitle: const Text('Licn no: JI533JN62464465',
            style: TextStyle(fontSize: 12)),
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
            onPressed: () {
              Navigator.pushNamed(context, '/seat_layout_first');
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
