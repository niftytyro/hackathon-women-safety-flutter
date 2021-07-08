import 'package:flutter/material.dart';
import 'package:contact_picker/contact_picker.dart';
import 'package:flutter/rendering.dart';
import 'package:naari_shakti/services/storage.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants.dart';

class EmergencySettings extends StatefulWidget {
  static const route = "/emergency";

  @override
  State<EmergencySettings> createState() => _EmergencySettingsState();
}

class _EmergencySettingsState extends State<EmergencySettings> {
  List contacts = [];
  bool location = true;

  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    storageService.readSettings().then(
          (value) => setState(
            () {
              print("value:");
              print(value);
              contacts = value['contacts'];
              _messageController.text = value['message'];
              if (value['location'] == null)
                storageService.writeLocation(location);
            },
          ),
        );
    _messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency Settings",
            style: kAppHeaderTextStyle.copyWith(fontSize: 18)),
        centerTitle: false,
        foregroundColor: Colors.black87,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: kScreenPadding,
        child: Column(
          children: [
            ...contacts.asMap().entries.map(
              (entry) {
                final contact = entry.value;
                final idx = entry.key;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contact['name'],
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Raleway')),
                          Text(contact['number'],
                              style: TextStyle(
                                  fontSize: 12, fontFamily: 'Raleway')),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            storageService.removeContact(idx).then((value) {
                              setState(() {
                                contacts = value['contacts'];
                              });
                            });
                          },
                          icon: Icon(Icons.clear)),
                    ],
                  ),
                );
              },
            ),
            Text(
              contacts.length == 0 ? "No contacts have been added." : "",
              textAlign: TextAlign.center,
            ),
            TextButton(
              child: Text("+ Add Contact"),
              onPressed: () async {
                if (await Permission.contacts.request().isGranted) {
                  final Contact contact = await ContactPicker().selectContact();
                  storageService.addContact(contact).then((value) {
                    setState(() {
                      contacts = value['contacts'];
                    });
                  });
                }
              },
            ),
            TextField(
              controller: _messageController,
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                    onPressed: () {
                      storageService.writeMessage(_messageController.text);
                    },
                    child: Text("Save")),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: location,
                  onChanged: (bool? newLocation) {
                    setState(() {
                      location = !location;
                      storageService.writeLocation(location);
                    });
                  },
                ),
                Text("Send location")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
