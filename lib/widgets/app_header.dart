import 'package:flutter/material.dart';
import 'package:naari_shakti/constants.dart';

class AppHeader extends StatelessWidget {
  static const tag = "app-header";

  AppHeader({
    this.style = kAppHeaderTextStyle,
  });

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      appName,
      style: style,
    );
  }
}
