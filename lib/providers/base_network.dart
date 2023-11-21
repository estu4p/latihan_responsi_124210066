import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseNetwork {
  static String baseUrl = "https://api.spaceflightnewsapi.net/v4";

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final String fullUrl = "${baseUrl}/${partUrl}";
    final response = await http.get(Uri.parse(fullUrl));
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = jsonDecode(body);
      return jsonBody;
    } else {
      print("Response error");
      return {"error": true};
    }
  }
}
