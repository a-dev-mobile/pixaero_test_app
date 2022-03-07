// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_News _$$_NewsFromJson(Map<String, dynamic> json) => _$_News(
      title: json['title'] as String? ?? 'Без заголовка',
      description: json['description'] as String? ?? 'Без описания',
      url: json['url'] as String? ?? '',
      urlToImage: json['urlToImage'] as String? ?? '',
    );

Map<String, dynamic> _$$_NewsToJson(_$_News instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
    };
