// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final int id;
  final String title;
  final String image_url;
  final String news_site;
  final String published_at;
  final String url;
  final String summary;

  NewsModel(this.url, this.summary,
      {required this.id,
      required this.title,
      required this.image_url,
      required this.news_site,
      required this.published_at});

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
