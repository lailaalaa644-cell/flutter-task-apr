import 'package:fib_task/countercubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class nav extends StatelessWidget {
  const nav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        body: BlocBuilder<CounterCubit, int>(
          builder: (context, count) {
            return Column(
              children: [
                Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => {context.read<CounterCubit>().increament()},
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () => {context.read<CounterCubit>().decreament()},
                  icon: Icon(Icons.subscript),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
