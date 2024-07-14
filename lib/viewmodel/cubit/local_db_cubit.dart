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
    Hive.box<dynamic>("saved_articles").add(news);
    emit([...state, news]);
  }

  void deleteNewsFromLocal(int index) {
    state.removeAt(index);
    emit(state);
  }

  @override
  void onChange(Change<List<dynamic>> change) {
    super.onChange(change);
    print(change);
  }
}
