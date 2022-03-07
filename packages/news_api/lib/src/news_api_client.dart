import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/src/models/models.dart';

class RequestFailure implements Exception {}

class NotFoundFailure implements Exception {}

class NewsApiClient {
  NewsApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'newsapi.org';
  final http.Client _httpClient;

// https://newsapi.org/v2/top-headlines?country=ru&apiKey=e9d9147a238c494fbfe0acf786cf79cb

  Future<List<News>> fetchNewsRu() async {
    final request = Uri.https(
      _baseUrl,
      'v2/top-headlines',
      <String, String>{
        'apiKey': 'e9d9147a238c494fbfe0acf786cf79cb',
        'country': 'ru',
      },
    );
    final response = await _httpClient.get(request);

    if (response.statusCode != 200) {
      throw RequestFailure();
    }

    final jsonBody = json.decode(response.body) as Map<String, dynamic>;

    final data = jsonBody['articles'] as List;

    if (data.isEmpty) {
      throw NotFoundFailure();
    }

    final newsList = data
        .map((dynamic e) => News.fromJson(e as Map<String, dynamic>))
        .toList();
    return newsList;
  }
}
