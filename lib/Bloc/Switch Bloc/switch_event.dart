

import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable{

  const SwitchEvent();

  @override
  List<Object?> get props => [];

}

class SwitchTriggerEvent extends SwitchEvent{}

class SliderEvent extends SwitchEvent{
  final double sliderVal;
  const SliderEvent({required this.sliderVal});

  @override
  List<Object?> get props => [sliderVal];
}
