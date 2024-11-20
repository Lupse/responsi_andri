import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.spaceflightnewsapi.net/v4';

  Future<List<T>> fetchList<T>(
      String menu, T Function(Map<String, dynamic>) fromJson) async {
    final response = await http.get(Uri.parse('$baseUrl/$menu/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List).map((item) => fromJson(item)).toList();
    } else {
      throw Exception('Failed to load $menu list');
    }
  }

  Future<T> fetchDetail<T>(
      String menu, int id, T Function(Map<String, dynamic>) fromJson) async {
    final response = await http.get(Uri.parse('$baseUrl/$menu/$id/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return fromJson(data);
    } else {
      throw Exception('Failed to load $menu detail');
    }
  }
}
