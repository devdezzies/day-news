import 'package:dayandnews/constants/app_palette.dart';
import 'package:dayandnews/view/widgets/article_info_bottom.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.imageUrl, required this.title});
  final String imageUrl; 
  final String title; 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 100,
      title: Text(
        title,
        style: const TextStyle(color: AppPalette.whiteFont, fontSize: 15, overflow: TextOverflow.ellipsis),
        maxLines: 3,
      ),
      
      leading: Container(
        decoration: const BoxDecoration(color: AppPalette.greyFont),
          width: 120,
          height: 100,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          )),
      subtitle: const ArticleInfoBottom(),
    );
  }
}
