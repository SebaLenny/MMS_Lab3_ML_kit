import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class MlService {
  Future<VisionText> getTextBlocksFromImage(File imageFile) async {
    final image = FirebaseVisionImage.fromFile(imageFile);
    final textDecetor = FirebaseVision.instance.textRecognizer();
    final visionText = await textDecetor.processImage(image);
    return visionText;
  }

  Future<List<ImageLabel>> getTextLabelsFromImage(File imageFile) async {
    final image = FirebaseVisionImage.fromFile(imageFile);
    final imageLabeler = FirebaseVision.instance.imageLabeler();
    final labels = await imageLabeler.processImage(image);
    return labels;
  }
}
