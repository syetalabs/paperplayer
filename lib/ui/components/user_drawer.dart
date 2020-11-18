import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            ListTile(
              leading: Icon(
                Icons.person,
                size: SizeConfig.blockSizeHorizontal * 6,
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
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.library_books,
                size: SizeConfig.blockSizeHorizontal * 6,
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
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                size: SizeConfig.blockSizeHorizontal * 6,
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
                  Icon(Icons.arrow_forward_ios),
                ],
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
