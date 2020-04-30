import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class MlService {
  Future<VisionText> getTextBlocksFromImage(File imageFile) async {
    final image = FirebaseVisionImage.fromFile(imageFile);
    final textDecetor = FirebaseVision.instance.textRecognizer();
    var visionText = await textDecetor.processImage(image);
    return visionText;
  }
}
