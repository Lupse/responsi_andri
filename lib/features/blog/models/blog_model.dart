// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'blog_model.g.dart';

@JsonSerializable()
class BlogModel {
  final int id;
  final String title;
  final String image_url;
  final String published_at;

  BlogModel(
      {required this.id,
      required this.title,
      required this.image_url,
      required this.published_at});

  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlogModelToJson(this);
}
