
import 'package:bloc_tutorials/Bloc/Counter%20Bloc/counter_bloc.dart';
import 'package:bloc_tutorials/Bloc/Image%20Picker%20Bloc/image_picker_bloc.dart';
import 'package:bloc_tutorials/Bloc/Switch%20Bloc/switch_bloc.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_bloc.dart';
import 'package:bloc_tutorials/Bloc/posts_bloc/post_bloc.dart';
import 'package:bloc_tutorials/Freezed%20Example/Freezed%20UI/freezed_ui.dart';
import 'package:bloc_tutorials/Repositories/SQLITE%20DB/sqlite_db_repo.dart';
import 'package:bloc_tutorials/Utils/Image%20Picker%20Utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/Fav Bloc/fav_bloc.dart';
import 'Repositories/Fav Repository/fav_repo.dart';

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
        BlocProvider(create: (_)=> TodoBloc(DatabaseRepository.instance)),
        BlocProvider(create: (_)=> FavBloc(FavRepository())),
        BlocProvider(create: (_)=> PostBloc()),
      ],
      child: MaterialApp(
          title: 'Bloc Tutorials',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const FreezedScreen()
      ),
    );
  }
}
