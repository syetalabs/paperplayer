import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:paperplayer/ui/screens/dashboard/home.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

final _currentPageNotifier = ValueNotifier<int>(0);
final _pageController = PageController();

final List<String> _titlesList = [
  '\'The Album\' gets it’s \nComeback Album.',
  'Show Album.\n Play Album.',
  'The Album returns.\n The vinyl doesn\'t.',
  'Millions of New & Reissued\nAlbums from \$4.99',
  'Plays on all\nMajor platforms',
];

final List<String> _subtitlesList = [
  'Improve your Self, your Family & your Home with\nServices & Experiences provided by Tweak.',
  'Improve your Self, your Family & your Home with\nServices & Experiences provided by Tweak.',
  'Improve your Self, your Family & your Home with\nServices & Experiences provided by Tweak.',
  'Improve your Self, your Family & your Home with\nServices & Experiences provided by Tweak.',
  'Improve your Self, your Family & your Home with\nServices & Experiences provided by Tweak.',
];

final List<String> _imageList = [
  'assets/albumPile.png',
  'assets/showAlbum.png',
  'assets/albumReturn.png',
  'assets/albumAll.png',
  'assets/spotify.png',
];
final List<Widget> _pages = [];

List<Widget> populatePages(BuildContext context) {
  _pages.clear();
  _titlesList.asMap().forEach((index, value) => _pages.add(getPage(
      _imageList.elementAt(index),
      value,
      _subtitlesList.elementAt(index),
      context)));
  _pages.add(getLastPage(context));
  return _pages;
}

Widget _buildCircleIndicator() {
  return CirclePageIndicator(
    selectedDotColor: Colors.black,
    dotColor: Constants.primaryTextColor,
    selectedSize: 10,
    size: 8.5,
    itemCount: _pages.length,
    currentPageNotifier: _currentPageNotifier,
  );
}

Widget getPage(
    String image, String title, String subTitle, BuildContext context) {
  SizeConfig().init(context);
  return Container(
    // color: Colors.white,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('assets/ppLogo.svg'),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 40,
              child: Image.asset(image),
            ),
            Text(
              title,
              style: TextStyle(
                color: Constants.darkTextColor,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w800,
                fontSize: SizeConfig.blockSizeHorizontal * 7,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subTitle,
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  color: Constants.darkTextColor,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget getLastPage(BuildContext context) {
  SizeConfig().init(context);
  return Container(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('assets/ppLogo.svg'),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 40,
              child: Image.asset('assets/past.png'),
            ),
            Text(
              'Ready for the Past?\n Spring 2021',
              style: TextStyle(
                color: Constants.darkTextColor,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w800,
                fontSize: SizeConfig.blockSizeHorizontal * 7,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 5,
                  horizontal: SizeConfig.blockSizeHorizontal * 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: Theme.of(context).cursorColor,
                        decoration: InputDecoration(
                          hintText: 'email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: SizeConfig.blockSizeHorizontal * 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Constants.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Constants.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Future<bool> setFinishedOnBoarding() async {
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // return prefs.setBool(Constants.FINISHED_ON_BOARDING, true);
  return true;
}

class WalkThrough extends StatefulWidget {
  static const routeName = '/walkthrough_screen';

  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 90,
                  width: double.infinity,
                  child: PageView(
                    controller: _pageController,
                    children: populatePages(context),
                    onPageChanged: (int index) {
                      _currentPageNotifier.value = index;
                      if (index == _titlesList.length) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                  ),
                ),
                //getLastPage(context),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: _buildCircleIndicator(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
