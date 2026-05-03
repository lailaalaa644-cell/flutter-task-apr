import 'package:fib_task/datacubit.dart';
import 'package:fib_task/datastate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class nav extends StatelessWidget {
  const nav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchCubit(),
      child: Scaffold(
        body: BlocBuilder<FetchCubit, Datastate>(
          builder: (context, state) {
            if (state is Success) {
              return Row(
                children: [
                  Text(state.name),
                  IconButton(
                    onPressed: () => {context.read<FetchCubit>().fetch()},
                    icon: Icon(Icons.download),
                  ),
                ],
              );
            } else if (state is Error) {
              return Row(
                children: [
                  Text(state.error),
                  IconButton(
                    onPressed: () => {context.read<FetchCubit>().fetch()},
                    icon: Icon(Icons.download),
                  ),
                ],
              );
            } else if (state is Loading) {
              return Row(
                children: [
                  CircularProgressIndicator(),
                  IconButton(
                    onPressed: () => {context.read<FetchCubit>().fetch()},
                    icon: Icon(Icons.download),
                  ),
                ],
              );
            } else {
              return IconButton(
                onPressed: () => {context.read<FetchCubit>().fetch()},
                icon: Icon(Icons.download),
              );
            }
          },
        ),
      ),
    );
  }
}
