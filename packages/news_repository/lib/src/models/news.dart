import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
  factory News({
    @Default('Без заголовка') String title,
    @Default('Без описания') String description,
    @Default('') String url,
    @Default('') String urlToImage,
  }) = _News;
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
