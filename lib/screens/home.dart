import 'package:flutter/material.dart';
import 'package:naari_shakti/constants.dart';
import 'package:naari_shakti/screens/emergency_settings.dart';
import 'package:naari_shakti/widgets/emergency_button.dart';
import 'package:naari_shakti/widgets/option_button.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<ScaffoldState> _modelScaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatelessWidget {
  static const route = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stree Raksha", style: kAppHeaderTextStyle),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Color(0xFF442222),
            iconSize: 28,
            onPressed: () {
              Navigator.pushNamed(context, EmergencySettings.route);
            },
          )
        ],
      ),
      floatingActionButton: const SizedBox(height: 1),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: kScreenPadding,
          child: Column(
            children: [
              OptionButton(
                title: "Anonymous Complaint",
                imageName: "anonymous_complaint.png",
                onPress: () {
                  showModalBottomSheet(
                      context: context, builder: anonymousComplaintBuilder);
                },
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
                title: "Share your thoughts/ideas",
                imageName: "feedback.png",
                onPress: () {
                  showModalBottomSheet(
                      context: context, builder: feedbackBuilder);
                },
              ),
              SizedBox(height: 80),
              EmergencyButton(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

Widget anonymousComplaintBuilder(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Padding(
      padding: kScreenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "File a complaint without revealing identity",
            style: kMenuTextStyle,
          ),
          SizedBox(height: 12),
          TextField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            decoration: InputDecoration(hintText: "Description..."),
          ),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Complaint submitted."),
                  behavior: SnackBarBehavior.floating,
                ));
                print("Complaint submitetedsssssssssssssssssssssssssssssssss");
              },
              child: Text("Submit"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget feedbackBuilder(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Padding(
      padding: kScreenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Share your thoughts and ideas about how we can empower women?",
            style: kMenuTextStyle,
          ),
          SizedBox(height: 12),
          TextField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            decoration: InputDecoration(hintText: "Description..."),
          ),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Complaint submitted."),
                  behavior: SnackBarBehavior.floating,
                ));
                print("Complaint submitetedsssssssssssssssssssssssssssssssss");
              },
              child: Text("Submit"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
