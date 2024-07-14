import 'package:dayandnews/constants/app_palette.dart';
import 'package:dayandnews/view/widgets/article_info_bottom.dart';
import 'package:flutter/material.dart';
import '../news_details_screen.dart';

class HeaderNews extends StatelessWidget {
  const HeaderNews({super.key, required this.news});
  final Map<dynamic, dynamic> news;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black),
      child: Stack(
        children: [
          Image.network(
            news['image'],
            fit: BoxFit.cover,
            height: 350,
          ),
          Container(
            padding: const EdgeInsets.only(right: 18, left: 18, bottom: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(167, 0, 0, 0),
                    Color.fromARGB(164, 0, 0, 0),
                    Colors.black,
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Container(
                //   margin: const EdgeInsets.only(top: 40, bottom: 15),
                //   alignment: Alignment.centerLeft,
                //   decoration: const BoxDecoration(
                //     border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
                //   ),
                //   child: const Text("Today", style: TextStyle(fontSize: 35, color: Color.fromARGB(228, 255, 255, 255), fontWeight: FontWeight.bold),),
                // ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return NewsDetailsScreen(
                        news: news,
                        
                      );
                    }),
                  ),
                  child: Text(
                    news['title'],
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: AppPalette.whiteFont),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ArticleInfoBottom(
                    publisher: news['source']['name'],
                    publishedAt: news['publishedAt'])
              ],
            ),
          )
        ],
      ),
    );
  }
}
