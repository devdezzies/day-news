import 'package:dayandnews/constants/app_palette.dart';
import 'package:dayandnews/view/widgets/article_info_bottom.dart';
import 'package:flutter/material.dart';

class HeaderNews extends StatelessWidget {
  const HeaderNews({super.key, required this.imgUrl, required this.headline});
  final String imgUrl;
  final String headline; 


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(imgUrl, fit: BoxFit.cover,),
          Container(
            padding: const EdgeInsets.only(right: 18, left: 18, bottom: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(120, 0, 0, 0),
                  Color.fromARGB(164, 0, 0, 0),
                  Colors.black,           
                ]
              )
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
                Text(headline, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 30, color: AppPalette.whiteFont), maxLines: 3, overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 10,),
                const ArticleInfoBottom()
              ],
            ),
          )
        ],
      )
    );
  }
}