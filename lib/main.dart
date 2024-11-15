import 'package:dayandnews/data/repositories/news_repository.dart';
import 'package:dayandnews/data/sources/news_data_provider.dart';
import 'package:dayandnews/routes.dart';
import 'package:dayandnews/viewmodel/cubit/local_db_cubit.dart';
import 'package:dayandnews/viewmodel/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NewsRepository(newsDataProvider: NewsDataProvider()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NewsBloc(context.read<NewsRepository>()),
          ),
          BlocProvider(
            create: (context) => NewsBlocSearched(context.read<NewsRepository>()),
          ),
          BlocProvider(create: (context) => LocalDbCubit())
        ],
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
