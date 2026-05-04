import 'package:equatable/equatable.dart';

class Formstate extends Equatable {
  final String email;
  final String emailError;
  final String pass;
  final String passerror;
  final bool sbmit;

  Formstate({
    required this.email,
    required this.emailError,
    required this.pass,
    required this.passerror,
    required this.sbmit,
  });

}
  Formstate copyWith({
    String? email;
    String? emailError;
  })
