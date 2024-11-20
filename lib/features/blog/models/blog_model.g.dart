// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image_url: json['image_url'] as String,
      published_at: json['published_at'] as String,
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.image_url,
      'published_at': instance.published_at,
    };
