import 'package:dayandnews/constants/app_palette.dart';
import 'package:dayandnews/view/widgets/article_info_bottom.dart';
import 'package:flutter/material.dart';

import '../news_details_screen.dart';

class NewsTile extends StatelessWidget {
  const NewsTile(
      {super.key,
      required this.news});
  final Map<String, dynamic> news;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return NewsDetailsScreen(news: news);
      })),
      minTileHeight: 100,
      title: Text(
        news['title'],
        style: const TextStyle(
            color: AppPalette.whiteFont,
            fontSize: 15,
            overflow: TextOverflow.ellipsis),
        maxLines: 3,
      ),
      leading: Container(
          decoration: const BoxDecoration(color: AppPalette.greyFont),
          width: 120,
          height: 100,
          child: Image.network(
            news['image'],
            fit: BoxFit.cover,
          )),
      subtitle: ArticleInfoBottom(publisher: news['source']['name'], publishedAt: news['publishedAt'] ,),
    );
  }
}
