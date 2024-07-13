import 'package:flutter_bloc/flutter_bloc.dart';

class LocalDbCubit extends Cubit<List<Map<String, dynamic>>> {
  LocalDbCubit() : super([]);

  void newsFetchedFromLocal(int index) {
    
  }

  void addNewsToLocal(Map<String, dynamic> news) {
    emit([...state, news]);
  }

  void deleteNewsFromLocal(int index) {
    state.removeAt(index);
    emit(state);
  }

  @override
  void onChange(Change<List<Map<String, dynamic>>> change) {
    super.onChange(change);
    print(change);
  }
}
