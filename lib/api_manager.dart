import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<dynamic> get(String url) async {
    var client = http.Client();
    var response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return json.decode(jsonString);
    } else {
      // show error message
      return null;
    }
  }
}
