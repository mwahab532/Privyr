import 'package:flutter/material.dart';

class contentviewprovider extends ChangeNotifier {
  String _Contentcurrentview = "Message";
  String hintedText = "Search Messages....";
  var Messegecontroller = TextEditingController();
  var Filecontroller = TextEditingController();
  var Pagecontroller = TextEditingController();
  TextEditingController get currentcontroller {
    switch (_Contentcurrentview) {
      case "File":
        return Filecontroller;
      case "Page":
        return Pagecontroller;
      default:
        return Messegecontroller;
    }
  }

  String get ContentCurrentview => _Contentcurrentview;

  void changeview(String view, String hinttext) {
    _Contentcurrentview = view;
    hintedText = hinttext;
    notifyListeners();
  }
}
