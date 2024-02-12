import 'package:bloc_tutorials/Bloc/Switch%20Bloc/switch_bloc.dart';
import 'package:bloc_tutorials/Bloc/Switch%20Bloc/switch_event.dart';
import 'package:bloc_tutorials/Bloc/Switch%20Bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchSliderScreen extends StatefulWidget {
  const SwitchSliderScreen({super.key});

  @override
  State<SwitchSliderScreen> createState() => _SwitchSliderScreenState();
}

class _SwitchSliderScreenState extends State<SwitchSliderScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .sizeOf(context)
        .width * 1;
    final height = MediaQuery
        .sizeOf(context)
        .height * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Slider & Switch Example',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notifications', style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                ),),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.isSwitchOn != current.isSwitchOn,
                  builder: (context, state) {
                    return Switch(
                        value: state.isSwitchOn,
                        onChanged: (val) {
                          context.read<SwitchBloc>().add(SwitchTriggerEvent());
                        }
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Container(
                  width: width,
                  height: height * .3,
                  color: Colors.red.withOpacity(state.sliderValue),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Slider(
                    value: state.sliderValue,
                    onChanged: (val) {
                      context.read<SwitchBloc>().add(SliderEvent(sliderVal: val));
                    }
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
