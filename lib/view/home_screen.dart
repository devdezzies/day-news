import 'package:dayandnews/constants/app_palette.dart';
import 'package:dayandnews/view/widgets/header_news.dart';
import 'package:dayandnews/view/widgets/news_tile.dart';
import 'package:dayandnews/viewmodel/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  void fetchNews() {
    context.read<NewsBloc>().add(NewsFetched(keyword: 'world'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.backgroundColor,
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsFailure) {
            return const SizedBox.shrink();
          }

          if (state is! NewsSuccess) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = state.newsModel.articles;
          return RefreshIndicator(
            onRefresh: () async {
              fetchNews();
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.black,
                  expandedHeight: 350,
                  title: const Text(
                          "Breaking News ─",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppPalette.primaryActive,
                              fontSize: 30),
                        ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: HeaderNews(
                      news: data[0]
                    ),
                  ),
                ),
                SliverList.builder(
                  itemCount: data.length - 1,
                  itemBuilder: (context, idx) {
                    return NewsTile(
                        news: data[idx+1],);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
