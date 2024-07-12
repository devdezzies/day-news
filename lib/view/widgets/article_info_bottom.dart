import 'package:dayandnews/constants/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:timeago_flutter/timeago_flutter.dart' as timeago;

class ArticleInfoBottom extends StatelessWidget {
  const ArticleInfoBottom({super.key, required this.publisher, required this.publishedAt});
  final String publisher;
  final String publishedAt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35,
        child: Container(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(children: [
              TextSpan(text: publisher, style: const TextStyle(
                fontSize: 13,
                color: AppPalette.primaryActive,
                fontWeight: FontWeight.w500,
                fontFamily: 'PlusJakartaSans'
              )),
              TextSpan(text: " • ${timeago.format(DateTime.parse(publishedAt)).toString()}", style: const TextStyle(
                fontSize: 13,
                color: AppPalette.greyFont,
                fontWeight: FontWeight.w500,
                fontFamily: 'PlusJakartaSans'
              ))
            ]),
            // style: TextStyle(
            //     fontSize: 15,
            //     color: AppPalette.greyFont,
            //     fontWeight: FontWeight.w600),
          ),
        ));
  }
}
