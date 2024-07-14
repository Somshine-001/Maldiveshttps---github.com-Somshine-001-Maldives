import 'dart:convert';

import 'package:maldive_application/config/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PostService {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future<dynamic> fetchPosts() async {
    final Response = await http.get(
      Uri.parse('$API_URL/api/posts'),
      headers: {'Content-Type': 'application/json'},
    );
    return jsonDecode(Response.body);
  }

  static Future<dynamic> fetchPost(String id) async {
    final Response = await http.get(
      Uri.parse('$API_URL/api/posts/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    return jsonDecode(Response.body);
  }
}
