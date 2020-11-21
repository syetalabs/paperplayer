import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:paperplayer/ui/animations/slide_navigation.dart';
import 'package:paperplayer/ui/screens/user_drawer/cart.dart';
import 'package:paperplayer/ui/screens/user_drawer/collection.dart';
import 'package:paperplayer/ui/screens/user_drawer/personal.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

import 'album_card.dart';

class UserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildTopDetails(),
            Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, SlideRightRoute(
                        builder: (context) => Personal()
                    )
                );
              },
              child: ListTile(
                leading: Image(
                  height: SizeConfig.blockSizeHorizontal * 5.5,
                  width: SizeConfig.blockSizeHorizontal * 5.5,
                  color: Constants.browseGrey,
                  image: Svg('assets/icons/user-circle.svg'),
                ),
                title: Text(
                  'Personal Information',
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
                    context, SlideRightRoute(
                    builder: (context) => Collection()
                )
                );
              },
              child: ListTile(
                leading: Image(
                  height: SizeConfig.blockSizeHorizontal * 5.5,
                  width: SizeConfig.blockSizeHorizontal * 5.5,
                  color: Constants.browseGrey,
                  image: Svg('assets/icons/album-collection.svg'),
                ),
                title: Text(
                  'My Collection',
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
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, SlideRightRoute(
                    builder: (context) => Cart()
                )
                );
              },
              child: ListTile(
                leading: Image(
                  height: SizeConfig.blockSizeHorizontal * 5.5,
                  width: SizeConfig.blockSizeHorizontal * 5.5,
                  color: Constants.browseGrey,
                  image: Svg('assets/icons/shopping-bag.svg'),
                ),
                title: Text(
                  'Cart',
                  style: TextStyle(
                    color: Constants.darkTextColor,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        color: Constants.tagYellow,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '5/\$30',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Metropolis',
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: SizeConfig.blockSizeHorizontal * 4,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 25,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => index % 2 == 1
                    ? AlbumCard('assets/albumCover1.png')
                    : AlbumCard('assets/albumCover2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildTopDetails() {
    return SizedBox(
      height: SizeConfig.blockSizeVertical * 15,
      child: Center(
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Constants.backgroundColor,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/user.jpg'),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Elena',
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                ),
              ),
            ),
            Stack(
              children: [
                ClipPath(
                  child: Container(
                    color: Colors.black,
                    width: 100,
                    height: SizeConfig.blockSizeVertical * 3.5,
                    child: Center(
                      child: Text(
                        'Pro',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                        ),
                      ),
                    ),
                  ),
                  clipper: CustomClipPath(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0.0, size.height);
    path.lineTo(size.width / 5, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
