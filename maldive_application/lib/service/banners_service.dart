import 'dart:convert';

import 'package:maldive_application/config/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class BannersService {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future<dynamic> fetchBanners() async {
    final Response = await http.get(
      Uri.parse('$API_URL/api/banners'),
      headers: {'Content-Type': 'application/json'},
    );

    if (Response.statusCode == 200) {
      return jsonDecode(Response.body);
    }
  }
}
