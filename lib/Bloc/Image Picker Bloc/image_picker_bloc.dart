
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../Utils/Image Picker Utils/image_picker_utils.dart';
import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {

  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_galleryCapture);
  }

  void _cameraCapture(CameraCapture event, Emitter<ImagePickerState> emit) async{
    final XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryCapture(GalleryImagePicker event, Emitter<ImagePickerState> emit) async{
    final XFile? file = await imagePickerUtils.galleryCapture();
    emit(state.copyWith(file: file));
  }


}
