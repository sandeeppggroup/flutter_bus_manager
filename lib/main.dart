import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/controller/login_provider.dart';
import 'package:flutter_bus_manager/views/bus_list_screen/bus_list_screen.dart';
import 'package:flutter_bus_manager/views/login_screen/login_screen.dart';
import 'package:flutter_bus_manager/views/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        routes: {
          '/': (context) => const SplashScreen(),
          '/login_screen': (context) => const LoginScreen(),
          '/bus_list_screen': (context) => const BusListScreen(),
        },
      ),
    );
  }
}
