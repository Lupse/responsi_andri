import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latihan_responsi_prak_mobile/features/blog/models/blog_model.dart';

class BlogService {
  static const baseUrl = 'https://api.spaceflightnewsapi.net/v4/blogs/';

  Future<List<BlogModel>> fetchBlog() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      final List result = jsonResponse['results'];

      return result
          .map(
            (json) => BlogModel.fromJson(json),
          )
          .toList();
    } else {
      throw Exception("Failed to fetch blog");
    }
  }
}
