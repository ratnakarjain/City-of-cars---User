// ignore_for_file: avoid_print


import 'package:cityofcars/Services/url.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:http/http.dart' as http;

register(String _name, String _mail, String _mobile) async {
  var prefs = Prefernece.pref;
  var url = Uri.parse(registerUrl);
  try {
    var response = await http.post(url, body: {
      'name': _name,
      'email': _mail,
      'mobile': _mobile,
    });
    return response.body;
  } catch (e) {
    print("error $e");
  }
}
