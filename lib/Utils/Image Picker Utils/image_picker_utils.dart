

import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {

  final ImagePicker picker = ImagePicker();

  Future<XFile?> cameraCapture() async{
    final XFile? file = await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    return file;
  }

  Future<XFile?> galleryCapture() async{
    final XFile? file = await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    return file;
  }

}