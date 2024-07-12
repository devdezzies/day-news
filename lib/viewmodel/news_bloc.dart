import 'package:dayandnews/data/models/news_model.dart';
import 'package:dayandnews/data/repositories/news_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<NewsFetched>(_onNewsFetched);
  }

  void _onNewsFetched(NewsFetched event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final data = await newsRepository.getNews(event.keyword);
      emit(NewsSuccess(newsModel: data));
    } catch (e) {
      emit(NewsFailure(e.toString()));
      throw e.toString();
    }
  }
}

class NewsBlocSearched extends Bloc<NewsSearched, NewsState> {
  final NewsRepository newsRepository;
  NewsBlocSearched(this.newsRepository) : super(NewsInitial()) {
    on<NewsSearched>(_onNewsSearched);
  }

  void _onNewsSearched(NewsSearched event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final data = await newsRepository.getNews(event.keyword);
      emit(NewsSuccess(newsModel: data));
    } catch (e) {
      emit(NewsFailure(e.toString()));
      throw e.toString();
    }
  }
}
