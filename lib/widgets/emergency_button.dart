import 'package:flutter/material.dart';
import 'package:naari_shakti/services/storage.dart';
import 'package:sms_maintained/sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class EmergencyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final settings = await storageService.readSettings();
        String message = settings['message'];
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        final address = (await Geocoder.local.findAddressesFromCoordinates(
                Coordinates(position.latitude, position.longitude)))
            .first;
        message += "\nMy location is: ${address.addressLine}";
        final List<String> recipients = await storageService.readNumbers();

        SmsSender sender = SmsSender();
        recipients.forEach((recipient) {
          SmsMessage sms = SmsMessage(recipient, message);
          sender.sendSms(sms);
          sms.onStateChanged.listen((state) {
            print(state);
          });
        });
      },
      child: Container(
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
      ),
    );
  }
}
