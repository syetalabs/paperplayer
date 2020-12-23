import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class PreviewScreen extends StatefulWidget {
  final String imgPath;
  final String fileName;
  PreviewScreen({this.imgPath, this.fileName});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isUploading = false;
  // Timer _timer;
  // int _start;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_start = 1;
    // startTimer();
  }

  @override
  void dispose() {
    //_timer.cancel();
    super.dispose();
  }

  // Future<void> startTimer() async {
  //   const oneSec = const Duration(seconds: 1);
  //   _timer = new Timer.periodic(
  //     oneSec,
  //         (Timer timer) => setState(
  //           () {
  //         if (_start < 1) {
  //           timer.cancel();
  //           Navigator.pop(context);
  //         } else {
  //           _start = _start - 1;
  //         }
  //       },
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Image.file(
                      File(widget.imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: uploadPicture(context),
            ),
            Container(
              padding: const EdgeInsets.only(right: 45, top: 17),
              child: previewClose(),
            ),
            isUploading
                ? Center(
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Constants.green),
                        )),
                  )
                : Container(),
          ],
        ));
  }

  Widget uploadPicture(context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        child: Container(
          height: SizeConfig.blockSizeHorizontal * 7,
          padding: EdgeInsets.symmetric(horizontal: 22),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Constants.green,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/mobile.svg',
                color: Constants.backgroundColor,
                height: 30,
              ),
              SizedBox(width: 15),
              Text(
                'Upload',
                style: TextStyle(
                  color: Constants.backgroundColor,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.blockSizeHorizontal * 2.9,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          uploadPic(context);
        },
      ),
    );
  }

  Widget previewClose() {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.clear,
          size: 28,
        ),
      ),
    );
  }

  Future getBytes() async {
    Uint8List bytes = File(widget.imgPath).readAsBytesSync();
    return ByteData.view(bytes.buffer);
  }

  Future uploadPic(BuildContext context) async {
    setState(() {
      isUploading = true;
    });
    FirebaseAuth.instance.signInAnonymously().then((value) async {
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(widget.fileName);
      UploadTask uploadTask =
          firebaseStorageRef.putFile(File(widget.imgPath));
       
      uploadTask.then((value) {
        setState(() {
          isUploading = false;
        });
        print('Profile Picture uploaded');
        _scaffoldKey.currentState
            .showSnackBar((SnackBar(content: Text('Photo Uploaded'))));
        Navigator.pop(context);
      });
    });
  }
}
