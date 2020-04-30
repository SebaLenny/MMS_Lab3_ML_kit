import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageService {
  File _imageFile;

  File get imageFile{
    return _imageFile;
  }

  Future<void> pickGallearyImage() async {
    _imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  Future<void> pickCameraImage() async {
    _imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
  }
}
