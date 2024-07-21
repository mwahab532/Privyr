import 'dart:async';
import 'package:flutter/material.dart';
import 'package:privyr/services/apiservices.dart';

class apiprovider with ChangeNotifier {
  Map<String, dynamic>? _data;
  bool _isapiLoading = true;
  String _selectedValue = 'All';
  String _errormessage = "";

  Map<String, dynamic>? get data => _data;
  bool get isapidataLoading => _isapiLoading;
  String get selectedvalue => _selectedValue;
  String get errormessage => _errormessage;
  final Apiservices _apiServices = Apiservices();

  apiprovider() {
    getdata();
  }

  Future<void> getdata() async {
    _isapiLoading = true;
    notifyListeners();
    print("Fetching data...");

    bool isConnected = await _apiServices.cheakconnection();
    if (isConnected) {
      try {
        final apiData = await _apiServices.Fetchdata().timeout(
          const Duration(seconds: 5),
          onTimeout: () {
            throw TimeoutException(
                "The connection has timed out, please try again later.");
          },
        );
        if (apiData != null) {
          _data = apiData;
          _errormessage = "";
        } else {
          _errormessage = "Url is not responding! try again";
        }
      } catch (e) {
        _errormessage = "Unable to load data at momment! try again";
      }
    } else {
      _errormessage = "No connection! cheak your internet connection";
    }

    _isapiLoading = false;
    notifyListeners();
  }

  void updateSort(String value) {
    _selectedValue = value;
    sortData();
    notifyListeners();
  }

  void sortData() {
    if (_data != null && _data!['data'] != null) {
      switch (_selectedValue) {
        case 'Alphabetically [A-Z]':
          _data!['data'].sort((a, b) {
            return a['attributes']['name']
                .toString()
                .compareTo(b['attributes']['name'].toString());
          } as dynamic);
          break;
        case 'id':
          _data!['data']
              .sort((a, b) => (a['id'] as int).compareTo(b['id'] as int));
          break;
        default:
          break;
      }
    }
  }
}
