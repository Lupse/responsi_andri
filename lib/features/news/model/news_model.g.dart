// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      json['url'] as String,
      json['summary'] as String,
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image_url: json['image_url'] as String,
      news_site: json['news_site'] as String,
      published_at: json['published_at'] as String,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.image_url,
      'news_site': instance.news_site,
      'published_at': instance.published_at,
      'url': instance.url,
      'summary': instance.summary,
    };
