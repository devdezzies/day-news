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
    context.read<LocalDbCubit>().newsFetchedFromLocal();
  }

  @override
  void dispose() {
    super.dispose();
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
              return Dismissible(
                background: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  alignment: Alignment.centerRight,
                  decoration: const BoxDecoration(color: AppPalette.primaryActive),
                  child: const Icon(Icons.delete),
                ),
                key: Key(state[index]['title']),
                onDismissed: (direction) {
                  context.read<LocalDbCubit>().deleteNewsFromLocal(index);
                },
                confirmDismiss: (direction) async {
                  return await showDialog(
                    context: context, 
                    builder: (context) {
                      return AlertDialog(
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.zero),
                      title: const Text("Confirm",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 30)),
                      content: const Text(
                          "Are you sure you wish to delete this article?",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 20)),
                      actions: <Widget>[
                        TextButton(
                            style: TextButton.styleFrom(
                                overlayColor:
                                    const Color.fromARGB(44, 244, 67, 54),
                                foregroundColor: Colors.red),
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text("DELETE")),
                        TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.green,
                              overlayColor:
                                  const Color.fromARGB(44, 182, 234, 24)),
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("CANCEL"),
                        ),
                      ],
                    );
                    }
                  );
                },
                child: NewsTile(news: state[index])
              );
            },
          );
        },
      ),
    );
  }
}
