part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

final class NewsFetched extends NewsEvent {
  final String keyword; 

  NewsFetched({required this.keyword});
}