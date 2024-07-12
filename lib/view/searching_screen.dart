import 'package:dayandnews/view/widgets/news_tile.dart';
import 'package:dayandnews/viewmodel/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({super.key});

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBlocSearched>().add(NewsSearched(keyword: 'example'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBlocSearched, NewsState>(
      builder: (context, state) {
        if (state is NewsFailure) {
          return const SizedBox.shrink();
        }

        if (state is! NewsSuccess) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final articles = state.newsModel.articles;
        return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, idx) {
              return NewsTile(news: articles[idx]);
            });
      },
    );
  }
}
