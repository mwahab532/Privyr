import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  late String Note;

  NoteProvider({this.Note = ""});

  void changeValue({required String value}) async {
    Note = value;
    notifyListeners();
  }
}
