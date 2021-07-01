import 'package:flutter/material.dart';
import 'package:naari_shakti/constants.dart';

class AppHeader extends StatelessWidget {
  AppHeader({
    this.fontSize,
  });

  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      appName,
      style: kSplashAppHeaderStyle,
    );
  }
}
