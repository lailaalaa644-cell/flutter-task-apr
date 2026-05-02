import 'package:fib_task/passCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class passPage extends StatelessWidget {
  const passPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassCubit(),
      child: Scaffold(
        body: Center(
          child: Container(
          child: BlocBuilder<PassCubit, bool>(
            builder: (context, isHidden) {
              return TextField(
                obscureText: isHidden,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => context.read<PassCubit>().togglepassword(),
                    icon: Icon( isHidden ? Icons.visibility : Icons.visibility_off,),
                  ),
                ),
              );
            },
          ),
                ),
        ),

      )
    );
  }
}
