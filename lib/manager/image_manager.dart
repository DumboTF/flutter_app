import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageManager {
  static ImageManager _instance;

  static ImageManager _getInstance() {
    if (_instance == null) {
      _instance = new ImageManager();
    }
    return _instance;
  }

  static ImageManager get instance => _getInstance();

  pickImage() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    return imageFile;
  }
  cropImage(String path) async{
    File cropped = await ImageCropper.cropImage(sourcePath: path,);
    if(cropped!=null){

    }
  }
}
