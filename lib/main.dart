import 'package:bloc_tutorials/Bloc/Counter%20Bloc/counter_bloc.dart';
import 'package:bloc_tutorials/Bloc/Image%20Picker%20Bloc/image_picker_bloc.dart';
import 'package:bloc_tutorials/Bloc/Switch%20Bloc/switch_bloc.dart';
import 'package:bloc_tutorials/UI/Image%20Picker%20Screen/image_picker_screen.dart';
import 'package:bloc_tutorials/Utils/Image%20Picker%20Utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> CounterBloc()),
        BlocProvider(create: (_)=> SwitchBloc()),
        BlocProvider(create: (_)=> ImagePickerBloc(ImagePickerUtils())),
      ],
      child: MaterialApp(
          title: 'Bloc Tutorials',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ImagePickerScreen()
      ),
    );
  }
}
