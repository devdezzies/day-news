class NewsModel {
  final List<dynamic> articles;

  NewsModel({required this.articles});

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(articles: map['articles']);
  }

}
