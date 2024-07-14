import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:maldive_application/config/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageService {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future<dynamic> fetchPages() async {
    final Response = await http.get(
      Uri.parse('$API_URL/api/pages'),
      headers: {'Content-Type': 'application/json'},
    );
    return jsonDecode(Response.body);
  }

  static Future<dynamic> fetchPage(String id) async {
    final Response = await http.get(
      Uri.parse('$API_URL/api/pages/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    return jsonDecode(Response.body);
  }
}
