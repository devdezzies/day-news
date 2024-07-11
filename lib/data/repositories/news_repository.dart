import 'dart:convert';

import 'package:dayandnews/data/models/news_model.dart';
import 'package:dayandnews/data/sources/news_data_provider.dart';

class NewsRepository {
  final NewsDataProvider _newsDataProvider;

  NewsRepository({required NewsDataProvider newsDataProvider}) : _newsDataProvider = newsDataProvider; 
  
  Future<NewsModel> getNews(String keyword) async {
    try {
      final response = await _newsDataProvider.getLatestNews(query: keyword);
      final data = jsonDecode(response);
      return NewsModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}