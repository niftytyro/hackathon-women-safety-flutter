import 'package:flutter/material.dart';
import 'package:naari_shakti/widgets/app_header.dart';

class SplashScreen extends StatelessWidget {
  static const route = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AppHeader(),
        ),
      ),
    );
  }
}
