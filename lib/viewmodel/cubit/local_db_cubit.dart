import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class LocalDbCubit extends Cubit<List<dynamic>> {
  LocalDbCubit() : super([]);

  void newsFetchedFromLocal() async {
    var box = await Hive.openBox('saved_articles');
    state.addAll(box.values.toList());
    emit(state);
  }

  void addNewsToLocal(Map<dynamic, dynamic> news) {
    if (!state.contains(news)) {
      Hive.box<dynamic>("saved_articles").add(news);
      emit([...state, news]);
    } 
  }

  void deleteNewsFromLocal(int index) {
    emit(List.from(state)..removeAt(index));
    Hive.box<dynamic>("saved_articles").deleteAt(index);
  }

  @override
  void onChange(Change<List<dynamic>> change) {
    super.onChange(change);
    print(change);
  }
}
