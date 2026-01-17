// ignore_for_file: must_be_immutable
part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  int count;
  CounterState(this.count);
}

final class CounterInitial extends CounterState {
  CounterInitial(super.count);
}

class NumberIncreamented extends CounterState {
  NumberIncreamented(super.count);
}

class NumberDecreamented extends CounterState {
  NumberDecreamented(super.count);
}