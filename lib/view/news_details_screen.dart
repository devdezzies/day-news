import 'package:dayandnews/constants/app_palette.dart';
import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.news});
  final Map<String, dynamic> news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppPalette.backgroundColor,
        leading: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            enableFeedback: false,
            overlayColor: Colors.transparent
          ),
            child: const Icon(
          Icons.arrow_back_ios_new,
          color: AppPalette.whiteFont,
        )),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 18),
                child: Text(news['title'], style: TextStyle(color: AppPalette.whiteFont, fontWeight: FontWeight.w700, fontSize: 25),),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 18),
                child: Image.network(news['image']),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 18),
                child: Text(news['description'], style: TextStyle(color: AppPalette.greyFont, fontSize: 15, fontWeight: FontWeight.w500),),
              ),
              Container(
                child: Text(news['content'], style: TextStyle(color: AppPalette.whiteFont, fontSize: 15,),),
              )
            ],
          ),
        ),
      )
    );
  }
}
