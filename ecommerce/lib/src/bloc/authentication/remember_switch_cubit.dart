import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'remember_switch_state.dart';

class RememberSwitchCubit extends Cubit<RememberSwitchState> {
  RememberSwitchCubit() : super(RememberSwitchInitial());

  void switchToggle(bool value) {
    emit(switchedChanged(value));
  }
}
