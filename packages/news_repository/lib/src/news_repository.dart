import 'package:news_api/news_api.dart' hide News;
import 'package:news_repository/src/models/modes.dart';

class NewsRepository {
  NewsRepository({NewsApiClient? newsApiClient})
      : _newsApiClient = newsApiClient ?? NewsApiClient();

  final NewsApiClient _newsApiClient;

  Future<List<News>> fetchNewsRu() async {
    final listNewsFormatted = <News>[];
    final listNewsUnFormatted = await _newsApiClient.fetchNewsRu();

    for (final item in listNewsUnFormatted) {
      listNewsFormatted.add(
        News(
          description: item.description,
          title: item.title,
          url: item.url,
          urlToImage: item.urlToImage,
        ),
      );
    }

    return listNewsFormatted;
  }
}
