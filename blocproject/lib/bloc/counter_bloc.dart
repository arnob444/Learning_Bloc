import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(0)) {
    on<CounterEvent>((event, emit) {

      int count = 0;
      if (event is Increment) {
        count++;
        emit(NumberIncreamented(count));
      }

      if (event is Decrement) {
        count--;
        emit(NumberDecreamented(count));
      }
    });
  }
}