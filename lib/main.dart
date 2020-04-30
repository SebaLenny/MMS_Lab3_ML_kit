import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ml_kit/Utility/dimens.dart';
import 'package:ml_kit/Utility/strings.dart';
import 'package:ml_kit/image_service.dart';
import 'package:ml_kit/menu_drawer.dart';
import 'package:ml_kit/ml_service.dart';
import 'package:ml_kit/picture_hub.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ImageService _imageService = ImageService();
  final MlService _mlService = MlService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.mainTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: Strings.mainTitle,
        imageService: _imageService,
        mlService: _mlService,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.imageService, this.mlService}) : super(key: key);

  final String title;
  final ImageService imageService;
  final MlService mlService;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void goToPictureHub() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PictureHub(widget.imageService, widget.mlService),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MenuDrawer(),
      body: Center(
        child: Text(
                "Take or pick the image :)",
                style: GoogleFonts.indieFlower(fontSize: Dimens.fontPrimary),
              ),
      ),
      floatingActionButton: Container(
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: Dimens.standardDistance),
              child: FloatingActionButton(
                heroTag: 'Photo form library',
                onPressed: () async {
                  await widget.imageService.pickGallearyImage();
                  goToPictureHub();
                },
                tooltip: 'Pick photo from library',
                child: Icon(Icons.photo_library),
              ),
            ),
            FloatingActionButton(
              heroTag: 'Photo from camera',
              onPressed: () async {
                await widget.imageService.pickCameraImage();
                goToPictureHub();
              },
              tooltip: 'Take a photo',
              child: Icon(Icons.photo_camera),
            ),
          ],
        ),
      ),
    );
  }
}
