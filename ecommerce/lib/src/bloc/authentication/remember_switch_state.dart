part of 'remember_switch_cubit.dart';

sealed class RememberSwitchState extends Equatable {
  const RememberSwitchState();

  @override
  List<Object> get props => [];
}

final class RememberSwitchInitial extends RememberSwitchState {}

class switchedChanged extends RememberSwitchState {
  final bool value;

  switchedChanged(this.value);

}
