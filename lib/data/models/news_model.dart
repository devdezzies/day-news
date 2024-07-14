
//@HiveType(typeId: 1)
class NewsModel {
  final List<dynamic> articles;

  NewsModel({required this.articles});

  factory NewsModel.fromMap(Map<dynamic, dynamic> map) {
    return NewsModel(articles: map['articles'] ?? []);
  }
}
