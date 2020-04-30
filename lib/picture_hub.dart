import 'package:flutter/material.dart';
import 'package:ml_kit/Utility/dimens.dart';
import 'package:ml_kit/Utility/strings.dart';
import 'package:ml_kit/ml_service.dart';

import 'image_service.dart';

class PictureHub extends StatelessWidget {
  final ImageService imageService;
  final MlService mlService;

  PictureHub(this.imageService, this.mlService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.photoHubTitle),
      ),
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.all(Dimens.standardDistance),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: Dimens.smallDistance,
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(Dimens.standardDistance),
                    child: Image.file(imageService.imageFile),
                  ),
                ),
                flex: 4,
              ),
              Expanded(
                child: SizedBox.expand(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: Dimens.smallDistance,
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Dimens.standardDistance),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          Strings.recognizeText,
                          style: TextStyle(
                            fontSize: Dimens.fontPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox.expand(
                  child: Container(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Dimens.standardDistance),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          Strings.recognizeObjects,
                          style: TextStyle(
                            fontSize: Dimens.fontPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
