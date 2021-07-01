import 'package:flutter/material.dart';
import 'package:naari_shakti/constants.dart';

class SignInButton extends StatelessWidget {
  const SignInButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.pink[300]),
        textStyle: MaterialStateProperty.all(kSignInButtonTextStyle),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 20, 12),
            child: Text("Sign in with"),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            height: 60,
            child: Image.asset("assets/icons/signin_google.png"),
          )
        ],
      ),
    );
  }
}
