class SearchState {
  final List<String> allNames;
  final List<String> results;
  final String query;
  final List<String> history;
  const SearchState({
    required this.allNames,
    required this.results,
    required this.query,
    required this.history,

  });
  SearchState copyWith({
    List<String>? allNames,
    List<String>? results,
    String? query,
    List<String>? history,
  }) {
    return SearchState(
      allNames: allNames ?? this.allNames,
      results: results ?? this.results,
      query: query ?? this.query,
      history: history ?? this.history,
    );
  }
}