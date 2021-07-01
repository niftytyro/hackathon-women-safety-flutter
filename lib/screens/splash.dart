import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:naari_shakti/constants.dart';
import 'package:naari_shakti/screens/auth.dart';
import 'package:naari_shakti/widgets/app_header.dart';

class SplashScreen extends StatefulWidget {
  static const route = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, AuthScreen.route),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Hero(
            tag: AppHeader.tag,
            child: AppHeader(
              style: kSplashAppHeaderStyle,
            ),
          ),
        ),
      ),
    );
  }
}
