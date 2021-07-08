import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:naari_shakti/constants.dart';
import 'package:naari_shakti/screens/auth.dart';
import 'package:naari_shakti/screens/home.dart';
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
      Duration(milliseconds: 1500),
      () async {
        await Firebase.initializeApp();
        Navigator.pushReplacementNamed(
          context,
          FirebaseAuth.instance.currentUser != null
              ? HomeScreen.route
              : AuthScreen.route,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
      backgroundColor: Colors.red[400],
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
