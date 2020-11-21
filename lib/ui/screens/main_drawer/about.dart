import 'package:flutter/material.dart';
import 'package:paperplayer/ui/components/appbar_subscreens.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class About extends StatelessWidget {
  static const routeName = '/drawer-about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: AppBarSubScreens(title: 'About'),
      body: Container(
        width: SizeConfig.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeHorizontal*26,
                bottom: SizeConfig.blockSizeHorizontal*6,
              ),
              width: SizeConfig.blockSizeHorizontal*34,
              height: SizeConfig.blockSizeHorizontal*34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                color: Constants.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Constants.lightGrey,
                    spreadRadius: 0.5,
                    blurRadius: 5,
                    offset: Offset(-1, 1), // changes position of shadow
                  ),
                ]
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    size: SizeConfig.blockSizeHorizontal*27,
                    color: Constants.black,
                  ),
                  Icon(
                    Icons.circle,
                    size: SizeConfig.blockSizeHorizontal*9,
                    color: Constants.backgroundColor,
                  ),
                ],
              ),
            ),
            Text(
              'paperplayer',
              style: TextStyle(
                color: Constants.darkTextColor,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.blockSizeHorizontal * 10,
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeHorizontal*6),
            Text(
              'VERSION: 1.0.2\nBUILD: 9897\nMODE: TRAINING',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.black,
                fontFamily: 'HKGrotesk',
                fontSize: SizeConfig.blockSizeHorizontal * 4,
                height: 1.5
              ),
            ),
          ],
        ),
      ),
    );
  }
}
