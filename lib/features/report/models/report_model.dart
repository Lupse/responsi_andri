// ignore_for_file: non_constant_identifier_names

import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
part 'report_model.g.dart';

@JsonSerializable()
class ReportModel {
  final int id;
  final String title;
  final String news_site;
  final String published_at;

  ReportModel(
      {required this.id,
      required this.title,
      required this.news_site,
      required this.published_at});

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportModelToJson(this);
}
