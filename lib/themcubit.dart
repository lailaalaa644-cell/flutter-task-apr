import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.light());
  void toggel() {
    emit(
      state.brightness == Brightness.light
          ? ThemeData.dark()
          : ThemeData.light(),
    );
  }
}
