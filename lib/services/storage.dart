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

  Future<File> get _localFile async {
    final path = await _localPath;

    final file = File('$path/data.json');
    if (!file.existsSync()) {
      file.createSync();
      file.writeAsStringSync("[]");
    }
    return file;
  }

  Future<List> addContact(Contact contact) async {
    final contacts = await readContacts();
    contacts.add({
      'name': contact.fullName,
      'number': contact.phoneNumber.number,
    });
    final file = await _localFile;
    file.writeAsStringSync(jsonEncode(contacts));
    return contacts;
  }

  Future<List> readContacts() async {
    try {
      final file = await _localFile;

      // Read the file
      final contactsRaw = await file.readAsString();
      return jsonDecode(contactsRaw);
    } catch (e) {
      // If encountering an error, return 0
      print(e);
      return [];
    }
  }

  Future<List> removeContact(int idx) async {
    final contacts = await readContacts();
    contacts.removeAt(idx);
    final file = await _localFile;
    file.writeAsStringSync(jsonEncode(contacts));
    return contacts;
  }
}
