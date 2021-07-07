import 'package:flutter/material.dart';
import 'package:naari_shakti/constants.dart';
import 'package:naari_shakti/screens/auth.dart';
import 'package:naari_shakti/screens/emergency_settings.dart';
import 'package:naari_shakti/screens/home.dart';
import 'package:naari_shakti/screens/splash.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFFFEFCFC),
      ),
      routes: {
        AuthScreen.route: (context) => AuthScreen(),
        EmergencySettings.route: (context) => EmergencySettings(),
        HomeScreen.route: (context) => HomeScreen(),
        SplashScreen.route: (context) => SplashScreen(),
      },
      initialRoute: SplashScreen.route,
    );
  }
}
