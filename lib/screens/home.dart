import 'package:flutter/material.dart';
import 'package:naari_shakti/constants.dart';
import 'package:naari_shakti/widgets/emergency_button.dart';
import 'package:naari_shakti/widgets/option_button.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stree Raksha", style: kAppHeaderTextStyle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kScreenPadding,
          child: Column(
            children: [
              Padding(
                padding: kScreenPadding,
                child: SizedBox(
                  height: 0.6 * MediaQuery.of(context).size.height,
                  child: Center(
                    child: EmergencyButton(),
                  ),
                ),
              ),
              OptionButton(
                title: "Anonymous Complaint",
                imageName: "anonymous_complaint.png",
              ),
              SizedBox(height: 8),
              OptionButton(
                title: "Self Defence",
                imageName: "self_defence.png",
              ),
              SizedBox(height: 8),
              OptionButton(
                title: "Feedback",
                imageName: "feedback.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
