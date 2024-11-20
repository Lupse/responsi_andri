// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => ReportModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      news_site: json['news_site'] as String,
      published_at: json['published_at'] as String,
    );

Map<String, dynamic> _$ReportModelToJson(ReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'news_site': instance.news_site,
      'published_at': instance.published_at,
    };
