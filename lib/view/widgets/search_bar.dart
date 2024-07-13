import 'package:dayandnews/constants/app_palette.dart';
import 'package:flutter/material.dart';

class SearchBarPrivate extends StatelessWidget {
  const SearchBarPrivate({super.key, required this.isTapped, required this.textEditingController, required this.onSubmit, required this.gestureTap});
  final Function() isTapped;
  final Function(String) onSubmit;
  final Function() gestureTap;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: SearchBar(
        onTap: isTapped,
        controller: textEditingController,
        onSubmitted: onSubmit,
        leading: GestureDetector(onTap: gestureTap,  child: const Icon(Icons.search, color: AppPalette.greyFont,)),
        hintText: 'Search',
        textStyle: const WidgetStatePropertyAll(TextStyle(color: AppPalette.greyFont)),
        hintStyle: const WidgetStatePropertyAll(TextStyle(color: AppPalette.greyFont)),
        shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
        backgroundColor: const WidgetStatePropertyAll(Color.fromARGB(43, 181, 181, 181)),
      ),
    );
  }
}