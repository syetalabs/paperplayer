import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:paperplayer/ui/animations/slide_navigation.dart';
import 'package:paperplayer/ui/screens/main_drawer/about.dart';
import 'package:paperplayer/ui/screens/main_drawer/contact.dart';
import 'package:paperplayer/ui/screens/main_drawer/how.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: SizeConfig.blockSizeVertical * 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'paperplayer ',
                    style: TextStyle(
                      color: Constants.darkTextColor,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockSizeHorizontal * 7,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: SizeConfig.blockSizeHorizontal*9,
                        color: Constants.black,
                      ),
                      Icon(
                        Icons.circle,
                        size: SizeConfig.blockSizeHorizontal*3,
                        color: Constants.backgroundColor,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.copyright,
                          size: SizeConfig.blockSizeHorizontal*2,
                          color: Constants.black,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Image(
                height: SizeConfig.blockSizeHorizontal * 5.5,
                width: SizeConfig.blockSizeHorizontal * 5.5,
                color: Constants.browseGrey,
                image: Svg('assets/icons/home-alt.svg'),
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: SizeConfig.blockSizeHorizontal * 4,
              ),
            ),
            Divider(),
            ListTile(
              leading: Image(
                height: SizeConfig.blockSizeHorizontal * 5.5,
                width: SizeConfig.blockSizeHorizontal * 5.5,
                color: Constants.browseGrey,
                image: Svg('assets/icons/search.svg'),
              ),
              title: Text(
                'Browse',
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: SizeConfig.blockSizeHorizontal * 4,
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, SlideLeftRoute(
                    builder: (context) => HowItWorks()
                )
                );
              },
              child: ListTile(
                leading: Image(
                  height: SizeConfig.blockSizeHorizontal * 5.5,
                  width: SizeConfig.blockSizeHorizontal * 5.5,
                  color: Constants.browseGrey,
                  image: Svg('assets/icons/question-circle.svg'),
                ),
                title: Text(
                  'How it works',
                  style: TextStyle(
                    color: Constants.darkTextColor,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, SlideLeftRoute(
                    builder: (context) => About()
                )
                );
              },
              child: ListTile(
                leading: Image(
                  height: SizeConfig.blockSizeHorizontal * 5.5,
                  width: SizeConfig.blockSizeHorizontal * 5.5,
                  color: Constants.browseGrey,
                  image: Svg('assets/icons/info-circle.svg'),
                ),
                title: Text(
                  'About',
                  style: TextStyle(
                    color: Constants.darkTextColor,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, SlideLeftRoute(
                    builder: (context) => Contact()
                  )
                );
              },
              child: ListTile(
                leading: Image(
                  height: SizeConfig.blockSizeHorizontal * 5.5,
                  width: SizeConfig.blockSizeHorizontal * 5.5,
                  color: Constants.browseGrey,
                  image: Svg('assets/icons/user-headset.svg'),
                ),
                title: Text(
                  'Contact',
                  style: TextStyle(
                    color: Constants.darkTextColor,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
