import 'package:flutter/material.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

final _currentPageNotifier = ValueNotifier<int>(0);
final _pageController = PageController();

final List<String> _imageList = [
  'assets/poster.png',
  'assets/poster.png',
  'assets/poster.png',
  'assets/poster.png',
  'assets/poster.png',
];

Widget _buildCircleIndicator() {
  return CirclePageIndicator(
    selectedDotColor: Constants.darkGrey,
    dotColor: Constants.lightGrey,
    selectedSize: 10,
    size: 8.5,
    itemCount: _pages.length,
    currentPageNotifier: _currentPageNotifier,
  );
}

final List<Widget> _pages = [];
List<Widget> populatePages(BuildContext context) {
  _pages.clear();
  _imageList
      .asMap()
      .forEach((index, value) => _pages.add(getPage(value, context)));
  return _pages;
}

Widget getPage(String image, BuildContext context) {
  SizeConfig().init(context);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(image, fit: BoxFit.cover)),
    ),
  );
}

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( 
      child: SizedBox(
        height: SizeConfig.safeBlockVertical * 30,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: SizeConfig.safeBlockVertical * 25.5,
              child: PageView(
                controller: _pageController,
                children: populatePages(context),
                onPageChanged: (int index) {
                  _currentPageNotifier.value = index;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _buildCircleIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
