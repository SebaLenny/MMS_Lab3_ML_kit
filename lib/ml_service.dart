import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class MlService{
    void getTextFromImage(File imageFile) async {
      final image = FirebaseVisionImage.fromFile(imageFile);
      final textDecetor = FirebaseVision.instance.textRecognizer();
      final text = await textDecetor.processImage(image);
      
    }
}