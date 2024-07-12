import 'package:dayandnews/constants/app_palette.dart';
import 'package:dayandnews/view/searching_screen.dart';
import 'package:dayandnews/view/static_explore_screen.dart';
import 'package:dayandnews/view/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodel/news_bloc.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  bool _isSearching = false;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.backgroundColor,
      appBar: AppBar(
        actions: _isSearching
            ? [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSearching = false;
                    });
                  },
                  child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: const Icon(Icons.close)),
                )
              ]
            : [],
        backgroundColor: AppPalette.backgroundColor,
        title: SearchBarPrivate(
          textEditingController: _textEditingController,
          gestureTap: () => context.read<NewsBlocSearched>().add(NewsSearched(keyword: _textEditingController.text.trim())),
          onSubmit: (_) => context.read<NewsBlocSearched>().add(NewsSearched(keyword: _textEditingController.text.trim())),
          isTapped: () {
            setState(() {
              _isSearching = true;
            });
          },
        ),
      ),
      body: _isSearching
          ? const SearchingScreen()
          : const StaticExploreScreen(),
    );
  }
}
