import 'package:flutter/material.dart';

class EmergencyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x4AFD0000),
            blurRadius: 100,
          ),
        ],
        borderRadius: BorderRadius.circular(1000),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: Image.asset("assets/images/emergency.png"),
      ),
    );
  }
}
