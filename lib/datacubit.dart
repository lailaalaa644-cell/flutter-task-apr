import 'package:fib_task/datastate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchCubit extends Cubit<Datastate> {
  FetchCubit() : super(Initial());
  void fetch() async {
    emit(Loading());
    try {
      await Future.delayed(Duration(seconds: 1));
      emit(Success(name: "laila"));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }
}
