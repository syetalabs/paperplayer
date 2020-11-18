import 'package:flutter/material.dart';
import 'package:paperplayer/ui/screens/dashboard/browse_screen.dart';
import 'package:paperplayer/ui/screens/dashboard/home.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  BottomNav(this.currentIndex);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical * 8,
      decoration: BoxDecoration(
        color: Constants.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 10,
            blurRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
              child: Icon(
                Icons.home_outlined,
                size: SizeConfig.blockSizeHorizontal * 10,
                color: currentIndex == 0
                    ? Constants.darkTextColor
                    : Constants.darkGrey,
              ),
            ),
            Transform.translate(
                offset: Offset(0, -SizeConfig.blockSizeVertical * 3),
                child: CircleAvatar(
                  radius: SizeConfig.blockSizeHorizontal * 8,
                  backgroundColor: Constants.darkTextColor,
                  child: Icon(
                    Icons.stop_circle,
                    color: Constants.backgroundColor,
                    size: SizeConfig.blockSizeHorizontal * 7,
                  ),
                )),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, BrowseScreen.routeName);
              },
              child: Icon(
                Icons.apps_outlined,
                size: SizeConfig.blockSizeHorizontal * 10,
                color: currentIndex == 2
                    ? Constants.darkTextColor
                    : Constants.darkGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
