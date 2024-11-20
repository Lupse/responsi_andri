import 'dart:convert';

import 'package:latihan_responsi_prak_mobile/features/news/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static const String baseUrl =
      'https://api.spaceflightnewsapi.net/v4/articles/';

  //fetch data
  Future<List<NewsModel>> fetchNews() async {
    final response = await http.get(Uri.parse(baseUrl));

    //parse json jadi list of news model
    if (response.statusCode == 200) {
      //decode json ke map
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      //ambil key result
      final List result = jsonResponse['results'];

      //parsing setiap item di list ke model
      return result
          .map(
            (json) => NewsModel.fromJson(json),
          )
          .toList();

      //api tidak terlalu kompleks, tidak ada key result
      // final List data = jsonDecode(response.body);
      // return data.map((json) => NewsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}
