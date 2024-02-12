
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState extends Equatable{

  final XFile? file;

  const ImagePickerState({
    this.file
  });

  ImagePickerState copyWith ({XFile? file}){
    return ImagePickerState(
      file: file ?? this.file
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [file];

}
