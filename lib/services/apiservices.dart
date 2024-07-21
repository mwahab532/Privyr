import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class Apiservices {
  Future<Map<String, dynamic>?> Fetchdata() async {
    String endpoint = "https://nexusberry-crm-strapi4.onrender.com/api/leeds";
    try {
      final response = await http.get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("No data avialable");
      }
    } catch (e) {
      throw Exception("fail to data");
    }
  }
  Future<bool> cheakconnection() async {
    var connectivitySingle = await Connectivity().checkConnectivity();
    if (connectivitySingle == ConnectivityResult.none) {
      return false;
    } else {
      try {
        final result = await InternetAddress.lookup('example.com');
        return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      } catch (e) {
        return false;
      }
    }
  }
}
