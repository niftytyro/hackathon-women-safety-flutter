import 'dart:convert';
import 'dart:io';

import 'package:contact_picker/contact_picker.dart';
import 'package:path_provider/path_provider.dart';

final StorageService storageService = StorageService();

class StorageService {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _settingsFile async {
    final path = await _localPath;

    final file = File('$path/data.json');
    if (!file.existsSync()) {
      file.createSync();
      file.writeAsStringSync(jsonEncode({'message': "", "contacts": []}));
    }
    return file;
  }

  Future<Map> addContact(Contact contact) async {
    final settings = await readSettings();
    settings['contacts'].add({
      'name': contact.fullName,
      'number': contact.phoneNumber.number,
      'location': true
    });
    final file = await _settingsFile;
    file.writeAsStringSync(jsonEncode(settings));
    return settings;
  }

  Future<List<String>> readNumbers() async {
    final settings = await readSettings();
    final List<String> contacts = settings['contacts']
        .map((contact) => contact['number'])
        .toList()
        .cast<String>();
    return contacts;
  }

  Future<Map> readSettings() async {
    try {
      final file = await _settingsFile;

      // Read the file
      final contactsRaw = await file.readAsString();
      return jsonDecode(contactsRaw);
    } catch (e) {
      // If encountering an error, return 0
      print(e);
      return {};
    }
  }

  Future<Map> removeContact(int idx) async {
    final settings = await readSettings();
    settings['contacts'].removeAt(idx);
    final file = await _settingsFile;
    file.writeAsStringSync(jsonEncode(settings));
    return settings;
  }

  Future<Map> writeMessage(String msg) async {
    final settings = await readSettings();
    settings['message'] = msg;
    final file = await _settingsFile;
    file.writeAsString(jsonEncode(settings));
    print("SettINGS");
    print(jsonEncode(settings));
    return settings;
  }

  Future<Map> writeLocation(bool location) async {
    final settings = await readSettings();
    settings['location'] = location;
    final file = await _settingsFile;
    file.writeAsStringSync(jsonEncode(settings));
    return settings;
  }
}
