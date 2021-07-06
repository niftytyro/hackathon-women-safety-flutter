import 'package:flutter/material.dart';
import 'package:naari_shakti/constants.dart';
import 'package:naari_shakti/widgets/emergency_button.dart';
import 'package:naari_shakti/widgets/option_button.dart';
import 'package:url_launcher/url_launcher.dart';

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
              SizedBox(height: 80),
              EmergencyButton(),
              SizedBox(height: 80),
              OptionButton(
                title: "Anonymous Complaint",
                imageName: "anonymous_complaint.png",
                onPress: () {},
              ),
              SizedBox(height: 8),
              OptionButton(
                title: "Self Defence",
                imageName: "self_defence.png",
                onPress: () {
                  try {
                    launch(
                        "https://www.youtube.com/playlist?list=PLHfTPxnG4fWq1Wa1vAt8NXnsr9pGmGvQ3");
                  } catch (err) {
                    print(err);
                  }
                },
              ),
              SizedBox(height: 8),
              OptionButton(
                title: "Feedback",
                imageName: "feedback.png",
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
