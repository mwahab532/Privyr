import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:privyr/contectservices/contectservices.dart';

class ContactProvider with ChangeNotifier {
  List<Contact> _contacts = [];
  ContactService _contactService = ContactService();

  List<Contact> get contacts => _contacts;

  Future<void> loadContacts() async {
    bool granted = await _contactService.requestContactPermission();
    if (granted) {
      _contacts = await _contactService.fetchContacts();
      notifyListeners();
    }
  }
}