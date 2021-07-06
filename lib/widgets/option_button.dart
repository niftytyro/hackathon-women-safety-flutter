import 'package:flutter/material.dart';

import '../constants.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    required this.title,
    required this.imageName,
    required this.onPress,
  });

  final String title;
  final String imageName;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("assets/images/$imageName"),
            ),
            SizedBox(width: 15),
            Text(
              title,
              style: kMenuTextStyle,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}
