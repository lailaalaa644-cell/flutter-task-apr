import 'package:equatable/equatable.dart';

class Formstate extends Equatable {
  final String email;
  final String? emailError;
  final String password;
  final String? passError;
  final bool isSubmit;

  Formstate({
    this.email = "",
    this.emailError,
    this.password = "",
    this.passError,
    this.isSubmit = false,
  });

  Formstate copyWith({
    String? email,
    String? emailError,
    String? password,
    String? passError,
    bool? isSubmit,
  }) {
    return Formstate(
      email: email ?? this.email,
      emailError: emailError,
      password: password ?? this.password,
      passError: passError,
      isSubmit: isSubmit ?? this.isSubmit,
    );
  }

  @override
  List<Object> get props => [
    email,
    emailError ?? "",
    password,
    passError ?? "",
    isSubmit,
  ];
}
