import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Changetextprovider extends ChangeNotifier {
  late String title;
  Map<int , String> _notes = {};

  void changeValue({required int index, required String value}) async {
    _notes[index] = value;
    notifyListeners();
  }

  getnoteindex(int index) {
    return _notes[index] ?? "";
  }


}
