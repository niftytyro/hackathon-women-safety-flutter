import 'package:flutter/material.dart';
import 'package:naari_shakti/constants.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kScreenPadding,
          child: Column(
            children: [
              Text(
                "Stree Raksha",
                style: kAppHeaderTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
