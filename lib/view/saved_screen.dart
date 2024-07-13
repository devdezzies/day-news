import 'package:dayandnews/constants/app_palette.dart';
import 'package:dayandnews/view/widgets/news_tile.dart';
import 'package:dayandnews/viewmodel/cubit/local_db_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:hive_flutter/adapters.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalette.backgroundColor,
        title: const Text(
          "Saved News",
          style: TextStyle(
              color: AppPalette.whiteFont,
              fontSize: 35,
              fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: AppPalette.backgroundColor,
      body: BlocBuilder<LocalDbCubit, List<dynamic>>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return NewsTile(news: state[index]);
            },
          );
        },
      ),
    );
  }
}
