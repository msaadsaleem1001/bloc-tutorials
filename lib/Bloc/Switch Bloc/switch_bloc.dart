
import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/Bloc/Switch%20Bloc/switch_event.dart';
import 'package:bloc_tutorials/Bloc/Switch%20Bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {

  SwitchBloc() : super(const SwitchState()) {
    on<SwitchTriggerEvent>(_switch);
    on<SliderEvent>(_slider);
  }

  void _switch(SwitchTriggerEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(switchVal: !state.isSwitchOn));
  }

  void _slider(SliderEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(sliderVal: event.sliderVal.toDouble()));
  }

}
