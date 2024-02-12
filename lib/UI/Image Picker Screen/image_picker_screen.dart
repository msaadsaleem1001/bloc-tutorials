
import 'dart:io';

import 'package:bloc_tutorials/Bloc/Image%20Picker%20Bloc/image_picker_bloc.dart';
import 'package:bloc_tutorials/Bloc/Image%20Picker%20Bloc/image_picker_event.dart';
import 'package:bloc_tutorials/Bloc/Image%20Picker%20Bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text('Image Picker Screen', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                  builder: (context, state){
                    if(state.file == null){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              context.read<ImagePickerBloc>().add(GalleryImagePicker());
                            },
                            child: const Text('Pick from Gallery')
                          ),
                          ElevatedButton(
                              onPressed: (){
                                context.read<ImagePickerBloc>().add(CameraCapture());
                              },
                              child: const Text('Camera')
                          ),
                        ],
                      );
                    }
                    else{
                      return Image.file(File(state.file!.path.toString()));
                    }
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
