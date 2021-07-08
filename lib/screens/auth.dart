import 'package:flutter/material.dart';
import 'package:naari_shakti/constants.dart';
import 'package:naari_shakti/widgets/app_header.dart';
import 'package:naari_shakti/widgets/sign_in_button.dart';

class AuthScreen extends StatelessWidget {
  static const route = "/auth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      body: SafeArea(
        child: Padding(
          padding: kScreenPadding,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: AppHeader.tag,
                  child: AppHeader(style: kSplashAppHeaderStyle),
                ),
                SignInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
