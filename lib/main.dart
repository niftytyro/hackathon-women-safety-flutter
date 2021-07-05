import 'package:flutter/material.dart';
import 'package:naari_shakti/constants.dart';
import 'package:naari_shakti/screens/auth.dart';
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
      theme: ThemeData.light(),
      routes: {
        AuthScreen.route: (context) => AuthScreen(),
        HomeScreen.route: (context) => HomeScreen(),
        SplashScreen.route: (context) => SplashScreen(),
      },
      initialRoute: SplashScreen.route,
    );
  }
}
