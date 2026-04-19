import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_state.dart';
class SearchCubit extends Cubit<SearchState> {
  Timer? _debounce;
  SearchCubit()
      : super(
          const SearchState(
            allNames: ['Laila', 'Ali', 'Mona', 'Sara', 'Mahmoud', 'Salma'],
            results: ['Laila', 'Ali', 'Mona', 'Sara', 'Mahmoud', 'Salma'],
            query: '',
            history:[],
            
          ),
        );
  void onQueryChanged(String value) {
    emit(state.copyWith(query: value));
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final filtered = state.allNames
          .where((name) =>
              name.toLowerCase().contains(value.toLowerCase()))
          .toList();
          addToHistory(value);
      emit(state.copyWith(results: filtered));
    });
  }
  void addToHistory(String query) {
  if (query.isEmpty) return;

  final updatedHistory = List<String>.from(state.history);

  if (!updatedHistory.contains(query)) {
    updatedHistory.insert(0, query);
  }

  emit(state.copyWith(history: updatedHistory));
}
  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
    
  }
}