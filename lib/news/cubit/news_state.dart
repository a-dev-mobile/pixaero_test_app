part of 'news_cubit.dart';

enum NewsStatus { initial, loading, success, failure }

extension NewsStatusX on NewsStatus {
  bool get isInitial => this == NewsStatus.initial;
  bool get isLoading => this == NewsStatus.loading;
  bool get isSuccess => this == NewsStatus.success;
  bool get isFailure => this == NewsStatus.failure;
}

class NewsState extends Equatable {
  NewsState({this.status = NewsStatus.initial, List<News>? newsList})
      : newsList = newsList ?? <News>[];

  final NewsStatus status;
  final List<News> newsList;

  @override
  List<Object?> get props => [status, newsList];

  NewsState copyWith({
    NewsStatus? status,
    List<News>? newsList,
  }) {
    return NewsState(
      status: status ?? this.status,
      newsList: newsList ?? this.newsList,
    );
  }
}
