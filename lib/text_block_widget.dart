import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ml_kit/Utility/strings.dart';

import 'Utility/dimens.dart';

class TextBlockWidget extends StatelessWidget {
  final String content;

  TextBlockWidget(this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Dimens.smallDistance,
      ),
      child: RaisedButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: content));
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(Strings.coppiedToClipBoard)),
          );
        },
        child: Container(
          padding: EdgeInsets.all(
            Dimens.smallDistance,
          ),
          child: Text(content),
        ),
      ),
    );
  }
}
