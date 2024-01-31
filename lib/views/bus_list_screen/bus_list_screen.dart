import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/controller/bus_list/provider/bus_list_provider.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';
import 'package:flutter_bus_manager/views/bus_list_screen/widgets/bus_driver_container.dart';
import 'package:flutter_bus_manager/views/bus_list_screen/widgets/card_list_tile.dart';
import 'package:flutter_bus_manager/views/widgets/company_logo.dart';
import 'package:flutter_bus_manager/views/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class BusListScreen extends StatelessWidget {
  const BusListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<BusListProvider>(context, listen: false).fetchBusList();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: CompanyLogo(fontSize: 40),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Row(
            children: [
              const Spacer(),
              BusDriverContainer(
                tittle: 'Bus',
                discription: 'Manage your Bus',
                image: Image.asset('assets/images/bus.png'),
                backgroundColor: mainColorLight,
                onPressed: () {
                  Navigator.pushNamed(context, '/seat_layout_second');
                },
              ),
              SizedBox(
                width: width * 0.05,
              ),
              BusDriverContainer(
                tittle: 'Driver',
                discription: 'Manage your Driver',
                image: Image.asset('assets/images/driver1.png'),
                backgroundColor: mainColorDark,
                onPressed: () {
                  Navigator.pushNamed(context, '/driver_list_screen');
                },
              ),
              const Spacer()
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 28, top: 20),
            child: Row(
              children: [
                Text('21 Buses Found'),
              ],
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: CardListTile(),
            ),
          ),
        ],
      ),
    );
  }
}
