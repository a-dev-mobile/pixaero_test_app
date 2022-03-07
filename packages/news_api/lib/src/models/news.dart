import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  News({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  final Source source;

  @JsonKey(defaultValue: '')
  final String author;

  @JsonKey(defaultValue: '')
  final String title;

  @JsonKey(defaultValue: '')
  final String description;

  @JsonKey(defaultValue: '')
  final String url;

  @JsonKey(defaultValue: '')
  final String urlToImage;

  @JsonKey(defaultValue: '')
  final String publishedAt;

  @JsonKey(defaultValue: '')
  final String content;

  @override
  String toString() {
    return 'title $title \n description $description';
  }
}

@JsonSerializable()
class Source {
  Source({required this.id, required this.name});
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String name;
}
