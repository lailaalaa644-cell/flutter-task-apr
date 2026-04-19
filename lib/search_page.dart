import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_cubit.dart';
import 'search_state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Search Cubit')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return TextField(
                    onChanged: (value) {
                      context.read<SearchCubit>().onQueryChanged(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search name',
                      border: const OutlineInputBorder(),
                      suffixIcon: state.query.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                context.read<SearchCubit>().onQueryChanged('');
                              },
                            )
                          : null,
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state.query.isEmpty) {
                      return ListView.builder(
                        itemCount: state.history.length,
                        itemBuilder: (context, index) {
                          final item = state.history[index];
                          return ListTile(
                            title: Text(item),
                            onTap: () {
                              context.read<SearchCubit>().onQueryChanged(item);
                            },
                          );
                        },
                      );
                    }

                    if (state.results.isEmpty) {
                      return Center(
                        child: Text('No results for "${state.query}"'),
                      );
                    }

                    return ListView.builder(
                      itemCount: state.results.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(state.results[index]));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget highlightText(String text, String query) {
  if (query.isEmpty) return Text(text);

  final lowerText = text.toLowerCase();
  final lowerQuery = query.toLowerCase();

  final start = lowerText.indexOf(lowerQuery);

  if (start == -1) return Text(text);

  final end = start + query.length;

  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: text.substring(0, start),
          style: const TextStyle(color: Colors.black),
        ),
        TextSpan(
          text: text.substring(start, end),
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: text.substring(end),
          style: const TextStyle(color: Colors.black),
        ),
      ],
    ),
  );
}
