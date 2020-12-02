import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:paperplayer/ui/screens/training/preview_page.dart';

class CameraScreen extends StatefulWidget {
  static const routeName = '/camera-screen';
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;

  Timer _timer;
  bool timerPressed;
  int _start;

  Future initCamera(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }

    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (cameraController.value.hasError) {
      print('Camera Error ${cameraController.value.errorDescription}');
    }

    try {
      await cameraController.initialize();
    } catch (e) {
      String errorText = 'Error ${e.code} \nError message: ${e.description}';
      print(errorText);
    }

    if (mounted) {
      setState(() {});
    }
  }

  Widget cameraPreview() {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return Text(
        'Loading',
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      );
    }

    return AspectRatio(
      aspectRatio: cameraController.value.aspectRatio,
      child: CameraPreview(cameraController),
    );
  }

  Widget cameraClose() {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      timerPressed = false;
      _start = 3;
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    availableCameras().then((value) {
      cameras = value;
      if(cameras.length > 0){
        setState(() {
          selectedCameraIndex = 0;
        });
        initCamera(cameras[selectedCameraIndex]).then((value) {

        });
      } else {
        print('No camera available');
      }
    }).catchError((e){
      print('Error : ${e.code}');
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  onCapture(context) async {
    try {
      final p = await getTemporaryDirectory();
      final name = DateTime.now();
      final path = "${p.path}/$name.png";
      setState(() {
        timerPressed = false;
        _start = 3;
      });
      await cameraController.takePicture(path).then((value) {
        print('here');
        print(path);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
                PreviewScreen(imgPath: path,fileName: "$name.png",)));

      });

    } catch (e) {
      showCameraException(e);
    }
  }

  getCameraLensIcons(lensDirection) {
    switch (lensDirection) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera_solid;
      case CameraLensDirection.external:
        return CupertinoIcons.photo_camera;
      default:
        return Icons.device_unknown;
    }
  }

  Widget cameraControl(context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        child: Container(
          height: SizeConfig.blockSizeHorizontal * 7,
          padding: EdgeInsets.symmetric(horizontal: 22),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: timerPressed ? Constants.green.withOpacity(0.6)
                : Constants.green,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/camera.svg',
                color: Constants.backgroundColor,
                height: 30,
              ),
              SizedBox(width: 15),
              Text(
                'Take a Shot',
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
          setState(() {
            timerPressed = true;
          });
          startTimer();

        },
      ),
    );
  }

  Future<void> startTimer() async {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
            onCapture(context);
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Constants.black,
      body: Container(
        child: Stack(
          children: <Widget>[
            RotatedBox(
              quarterTurns: 3,
              child: Align(
                alignment: Alignment.center,
                child: cameraPreview(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: cameraControl(context),
            ),
            Container(
              padding: const EdgeInsets.only(right: 45, top: 17),
              child: cameraClose(),
            ),
            timerPressed ? Container(
              width: SizeConfig.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    alignment: Alignment.center,
                    width: SizeConfig.blockSizeHorizontal * 24,
                    height: SizeConfig.blockSizeHorizontal * 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 12,
                        ),
                        border: Border.all(
                          width: 5,
                          style: BorderStyle.solid,
                          color: Constants.green,
                        )
                    ),
                    child: Text(
                      '$_start',
                      style: TextStyle(
                        color: Constants.green,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w800,
                        fontSize: SizeConfig.blockSizeHorizontal * 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'PHOTO IN $_start SECONDS',
                    style: TextStyle(
                      color: Constants.green,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w800,
                      fontSize: SizeConfig.blockSizeHorizontal * 2.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ) : Container(),
          ],
        ),
      ),
    );
  }

  void showCameraException(e) {
    print("camera exception");
  }
}

