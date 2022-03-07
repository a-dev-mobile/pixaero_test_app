import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_repository/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._newsRepository) : super(NewsState());

  final NewsRepository _newsRepository;

  Future<void> fetchNews() async {
    emit(state.copyWith(status: NewsStatus.loading));
    try {
      final newsList = await _newsRepository.fetchNewsRu();
      emit(state.copyWith(status: NewsStatus.success, newsList: newsList));
    } on Exception {
      emit(state.copyWith(status: NewsStatus.failure));
    }
  }
}
