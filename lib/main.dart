import 'package:dayandnews/data/repositories/news_repository.dart';
import 'package:dayandnews/data/sources/news_data_provider.dart';
import 'package:dayandnews/routes.dart';
import 'package:dayandnews/viewmodel/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NewsRepository(newsDataProvider: NewsDataProvider()),
      child: BlocProvider(
        create: (context) => NewsBloc(context.read<NewsRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: Colors.black,
              fontFamily: 'PlusJakartaSans'),
          home: const Routes(),
        ),
      ),
    );
  }
}
