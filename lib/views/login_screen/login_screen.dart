import 'package:flutter/material.dart';
import 'package:flutter_bus_manager/controller/login/provider/login_provider.dart';
import 'package:flutter_bus_manager/core/colors/colors.dart';
import 'package:flutter_bus_manager/views/login_screen/widgets/welcome_widget.dart';
import 'package:flutter_bus_manager/views/widgets/custom_buttons.dart';
import 'package:flutter_bus_manager/views/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeWidget(),
            SizedBox(
              height: height * 0.05,
            ),
            CustomTextField(
                controller: loginProvider.usernameController,
                label: 'Enter Username'),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
                controller: loginProvider.passwordController,
                label: 'Enter Password'),
            SizedBox(
              height: height * 0.33,
            ),
            CustomButtons(
              label: 'Login',
              onPressed: () {
                Provider.of<LoginProvider>(context, listen: false)
                    .userLogin(context);
              },
              buttonColor: mainColorLight,
              labelColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
