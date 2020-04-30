import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:ml_kit/Utility/dimens.dart';
import 'package:ml_kit/Utility/strings.dart';
import 'package:ml_kit/ml_service.dart';
import 'package:ml_kit/text_block_widget.dart';

import 'image_service.dart';

class PictureText extends StatefulWidget {
  final ImageService imageService;
  final MlService mlService;

  PictureText(this.imageService, this.mlService);

  @override
  _PictureTextState createState() => _PictureTextState();
}

class _PictureTextState extends State<PictureText> {
  ScrollController _scrollViewController;

  List<TextBlock> textBlocks;
  List<Widget> widgets = List<Widget>();

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    widget.mlService.getTextBlocksFromImage(widget.imageService.imageFile).then((value) {
    setState(() {
      textBlocks = value.blocks; 
      widgets = buildView();
    });
  });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  List<Widget> constructBlocks() {
    List<Widget> list = List<Widget>();
    for (var block in textBlocks) {
      list.add(TextBlockWidget(block.text));
    }
    return list;
  }

  List<Widget> buildView() {
    List<Widget> list = List<Widget>();
    list.add(Container(
      margin: EdgeInsets.only(
        bottom: Dimens.smallDistance,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.standardDistance),
        child: Image.file(widget.imageService.imageFile),
      ),
    ));
    var widgetList = constructBlocks();
    for (var widget in widgetList) {
      list.add(widget);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.photoHubTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimens.standardDistance),
        child: ListView(
          controller: _scrollViewController,
          children: widgets,
        ),
      ),
    );
  }
}
