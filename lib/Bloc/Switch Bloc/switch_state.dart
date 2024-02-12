
import 'package:equatable/equatable.dart';

class SwitchState extends Equatable{

  final bool isSwitchOn;
  final double sliderValue;

  const SwitchState({this.isSwitchOn = false, this.sliderValue = 0.5});

  SwitchState copyWith({bool? switchVal, double? sliderVal}){
    return SwitchState(
        isSwitchOn: switchVal ?? isSwitchOn,
        sliderValue: sliderVal ?? sliderValue
    );
  }

  @override
  List<Object?> get props => [isSwitchOn, sliderValue];

}
