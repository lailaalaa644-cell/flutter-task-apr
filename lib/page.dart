import 'package:flutter/material.dart';

class Themepage extends StatelessWidget {
  const Themepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Themecubit extends Cubit<ThemeData> {
//   Themecubit() : super(ThemeData.light());
//   void toggle() {
//     emit(state == ThemeData.light() ? ThemeData.dark() : ThemeData.light());
//   }
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => Themecubit(),
//       child: BlocBuilder<Themecubit, ThemeData>(
//         builder: (context, state) {
//           return MaterialApp(
//             theme: state,
//             home: Home());
//         },
//       ),
//     );
//   }
// }


// AppBar(
//           actions: [
//             IconButton(
//               onPressed: context.read<Themecubit>().toggle,
//               icon: Icon(Icons.dark_mode),
//             ),
//           ],
//         ),