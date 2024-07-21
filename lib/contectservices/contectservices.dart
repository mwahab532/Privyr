import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactService {
  Future<bool> requestContactPermission() async {
    var status = await Permission.contacts.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      status = await Permission.contacts.request();
    }
    return status.isGranted;
  }

  Future<List<Contact>> fetchContacts() async {
    return await ContactsService.getContacts();
  }
}