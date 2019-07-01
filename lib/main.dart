import 'package:flutter/material.dart';
import 'package:bigin_app/screens/login_screen.dart';
import 'package:bigin_app/screens/registration_screen.dart';
import 'package:bigin_app/screens/user_profile_screen.dart';
void main() => runApp(BigHR());

class BigHR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id : (context) => LoginScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        UserProfileScreen.id : (context) => UserProfileScreen(),
      },
    );
  }
}