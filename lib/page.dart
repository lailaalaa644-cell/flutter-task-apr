import 'package:fib_task/themcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Themepage extends StatelessWidget {
  const Themepage({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<ThemeCubit>().toggel(),
      icon: Icon(Icons.dark_mode),
    );
  }
}
