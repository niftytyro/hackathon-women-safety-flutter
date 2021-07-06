import 'package:flutter/material.dart';

class EmergencyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xAAFD0000),
              blurRadius: 50,
            ),
          ],
          borderRadius: BorderRadius.circular(constraints.maxHeight),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            constraints.maxHeight,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints.loose(
              Size(constraints.maxWidth, 0.5 * constraints.maxHeight),
            ),
            child: Image.asset("assets/images/emergency.png"),
          ),
        ),
      ),
    );
  }
}
