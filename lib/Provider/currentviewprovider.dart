import 'package:flutter/material.dart';

class currentview extends ChangeNotifier {
  String _Currentview = "Allclients";

  String get Currentview => _Currentview;

  void changecurrentview(String view) {
    _Currentview = view;
    notifyListeners();
  }
}
