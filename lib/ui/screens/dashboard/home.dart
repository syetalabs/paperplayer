import 'package:flutter/material.dart';
import 'package:paperplayer/ui/components/album_card.dart';
import 'package:paperplayer/ui/components/appbar.dart';
import 'package:paperplayer/ui/components/bottom_nav.dart';
import 'package:paperplayer/ui/components/image_slider.dart';
import 'package:paperplayer/ui/components/main_drawer.dart';
import 'package:paperplayer/ui/components/user_drawer.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: CommanAppBar(),
      drawer: MainDrawer(),
      endDrawer: UserDrawer(),
      bottomNavigationBar: BottomNav(0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'New Releases',
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'HKGrostesk',
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Old Releases',
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'HKGrostesk',
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 25,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => index % 2 != 1
                    ? AlbumCard('assets/albumCover1.png')
                    : AlbumCard('assets/albumCover2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
