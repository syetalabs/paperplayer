import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paperplayer/ui/screens/training/camera.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class TrainingIntro extends StatefulWidget {
  static const routeName = '/training-intro';
  @override
  _TrainingIntroState createState() => _TrainingIntroState();
}

class _TrainingIntroState extends State<TrainingIntro> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            alignment: Alignment.centerLeft,
            colorFilter: new ColorFilter.mode(
              Constants.backgroundColor.withOpacity(0.5),
              BlendMode.dstATop,
            ),
            image: AssetImage('assets/posterEmpty.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/albumImg.jpg',
                      height: SizeConfig.blockSizeHorizontal * 17,
                    ),
                  ),
                  Text(
                    'To make PaperPlayer work,',
                    style: TextStyle(
                      color: Constants.black,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockSizeHorizontal * 2.6,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'We need ‘Training’ photos of you showing an Album',
                    style: TextStyle(
                      color: Constants.black,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockSizeHorizontal * 2.6,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '(Any Album, Any Angle, Thanks for your help)',
                    style: TextStyle(
                      color: Constants.black,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockSizeHorizontal * 2,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CameraScreen.routeName);
                    },
                    child: Container(
                      height: SizeConfig.blockSizeHorizontal * 7,
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Constants.black,
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
                            'Begin Taking Shots',
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
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              left: 20,
              child: SizedBox(
                child:Text(
                  'AI Training Mode',
                  style: TextStyle(
                    color: Constants.textColor,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.blockSizeHorizontal * 3,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 20,
              child: SizedBox(
                width: SizeConfig.blockSizeVertical * 35,
                child: SvgPicture.asset(
                  'assets/ppLogo.svg',
                  color: Constants.textColor,
                ),
              ),
            ),
            Positioned(
              top: 26,
              right: 26,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/mobile.svg',
                  color: Constants.lightGrey,
                  height: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
