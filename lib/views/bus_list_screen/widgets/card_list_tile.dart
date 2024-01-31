import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/controller/bus_list/provider/bus_list_provider.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';
import 'package:flutter_bus_manager/model/bus_model/bus_model.dart';
import 'package:provider/provider.dart';

class CardListTile extends StatelessWidget {
  const CardListTile({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Consumer<BusListProvider>(
      builder: (context, value, child) {
        List<BusModel> busList = value.busList;
        return ListView.builder(
          itemCount: busList.length,
          itemBuilder: (context, index) {
            BusModel bus = busList[index];

            return Card(
              child: ListTile(
                leading: SizedBox(
                  width: 70, // Adjust the width as needed
                  child: SizedBox(
                    height: height * 0.1,
                    child: Image.asset('assets/images/bus_scania.png'),
                  ),
                ),
                title: Text(bus.name,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500)),
                subtitle: Text(bus.type, style: const TextStyle(fontSize: 12)),
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
                      'Manage',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
