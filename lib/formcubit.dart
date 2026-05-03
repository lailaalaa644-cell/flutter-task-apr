
import 'package:fib_task/formstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Formcubit extends Cubit<Formstate> {
  Formcubit() : super(Formstate());
  void onEmailChange(String value) {
    emit(
      state.copyWith(
        email: value,
        emailError: value.contains("@") ? null : " Invalid email",
        isSubmit: value.contains("@") && state.password.length >= 6,
      ),
    );
  }

  void onPasswordChange(String value) {
    emit(
      state.copyWith(
        password: value,
        passError: value.length >= 6 ? null : "at least 6",
        isSubmit: value.length >= 6 && state.email.contains("@")
      ),
    );
  }
}