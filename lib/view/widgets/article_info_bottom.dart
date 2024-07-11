import 'package:dayandnews/constants/app_palette.dart';
import 'package:flutter/material.dart';

class ArticleInfoBottom extends StatelessWidget {
  const ArticleInfoBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35,
        child: Container(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: const TextSpan(children: [
              TextSpan(text: "Toronto Star ", style: TextStyle(
                fontSize: 13,
                color: AppPalette.primaryActive,
                fontWeight: FontWeight.w500,
                fontFamily: 'PlusJakartaSans'
              )),
              TextSpan(text: "• 4 hours ago", style: TextStyle(
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
