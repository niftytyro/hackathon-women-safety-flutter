import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      routes: {
        SplashScreen.route: (context) => SplashScreen(),
      },
      initialRoute: SplashScreen.route,
    );
  }
}
