import 'package:flutter/material.dart';
import 'package:naari_shakti/constants.dart';
import 'package:naari_shakti/screens/auth.dart';
import 'package:naari_shakti/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData.light(),
      routes: {
        SplashScreen.route: (context) => SplashScreen(),
        AuthScreen.route: (context) => AuthScreen(),
      },
      initialRoute: SplashScreen.route,
    );
  }
}
