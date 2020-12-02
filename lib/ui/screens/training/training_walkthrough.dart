import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:paperplayer/ui/screens/training/player_training_intro.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class TrainingWalkThrough extends StatefulWidget {
  static const routeName = '/training_walkthrough_screen';
  @override
  _TrainingWalkThroughState createState() => _TrainingWalkThroughState();
}

class _TrainingWalkThroughState extends State<TrainingWalkThrough> {

  ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);
  PageController _pageController = PageController();

  final List<String> _titlesList = [
    'Help train PaperPlayer',
    'Show us your Albums',
    'Thank you for your help',
  ];

  final List<String> _subtitlesList = [
    'For Paper Player to work, we need to train our Ai engine how to '
        'recognize Albums.',
    'You can help by joining our Beta Trainer Team and show us a few '
        'of your Albums',
    'To start, set your phone as a Horizontal Device and let’s take some '
        'shots of your collection. Thanks !',
  ];

  final List<String> _imageList = [
    'assets/pl1.png',
    'assets/albumImg.jpg',
    'assets/pl3.png',
  ];
  final List<Widget> _pages = [];

  List<Widget> populatePages(BuildContext context) {
    _pages.clear();
    _titlesList.asMap().forEach(
          (index, value) => _pages.add(
        getPage(
          _imageList.elementAt(index),
          value,
          _subtitlesList.elementAt(index),
          context,
        ),
      ),
    );
    return _pages;
  }

  Widget _buildCircleIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _currentPageNotifier.value != 0 ? GestureDetector(
          onTap: (){
            setState(() {
              _pageController.animateToPage(
                _currentPageNotifier.value-1,
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            });
          },
          child: Container(
            alignment: Alignment.center,
            width: SizeConfig.blockSizeHorizontal * 13,
            child: new Text(
              "back",
              style: TextStyle(
                color: Constants.tagYellow,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.blockSizeHorizontal * 5.6,
              ),
            ),
          ),
        ) : SizedBox(width: SizeConfig.blockSizeHorizontal * 13),
        SizedBox(width: 8),
        CirclePageIndicator(
          selectedDotColor: Constants.textColor.withOpacity(0.4),
          dotColor: Constants.textColor.withOpacity(0.2),
          selectedSize: 10,
          size: 8.5,
          itemCount: _pages.length,
          currentPageNotifier: _currentPageNotifier,
        ),
        SizedBox(width: 8),
        _currentPageNotifier.value != _pages.length-1 ? GestureDetector(
          onTap: (){
            setState(() {
              _pageController.animateToPage(
                _currentPageNotifier.value+1,
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            });
          },
          child: Container(
            alignment: Alignment.center,
            width: SizeConfig.blockSizeHorizontal * 13,
            child: new Text(
              "next",
              style: TextStyle(
                color: Constants.tagYellow,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.blockSizeHorizontal * 5.6,
              ),
            ),
          ),
        ) : GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, TrainingIntro.routeName);
          },
          child: Container(
            alignment: Alignment.center,
            width: SizeConfig.blockSizeHorizontal * 13,
            child: new Text(
              "start",
              style: TextStyle(
                color: Constants.tagYellow,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.blockSizeHorizontal * 5.6,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getPage(
      String image, String title, String subTitle, BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.safeBlockVertical * 45,
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: SizeConfig.safeBlockVertical * 17,
                child: Image.asset(image),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 2.5,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w800,
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 16),
                child: Text(
                  subTitle,
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    color: Constants.darkTextColor,
                    fontSize: SizeConfig.blockSizeHorizontal * 4.4,
                    fontStyle: FontStyle.normal,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        title[0]=='3' ? Positioned(
            bottom: SizeConfig.blockSizeVertical* 4,
            child: new RaisedButton(
                child: new Text(
                  "Let’s Play",
                  style: TextStyle(
                    color: Constants.backgroundColor,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w800,
                    fontSize: SizeConfig.blockSizeHorizontal * 2.5,
                  ),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, TrainingIntro.routeName);
                },
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
                color: Constants.textColor,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5),
                )
            )
        ) : Container(),
      ],
    );
  }

  @override
  void initState(){
    super.initState();
    populatePages(context);
    setState(() {
      _currentPageNotifier = ValueNotifier<int>(0);
    });
  }

  @override
  dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical * 45,
      color: Constants.backgroundColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SingleChildScrollView(
            child:  SizedBox(
              height: SizeConfig.blockSizeVertical * 45,
              width: double.infinity,
              child: PageView(
                controller: _pageController,
                children: [
                  getPage(_imageList[0], _titlesList[0],
                      _subtitlesList[0], context),
                  getPage(_imageList[1], _titlesList[1],
                      _subtitlesList[1], context),
                  getPage(_imageList[2], _titlesList[2],
                      _subtitlesList[2], context),
                ],
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageNotifier.value = index;
                  });
                },
              ),
            ),
          ),
          //getLastPage(context),
          Positioned(
            bottom: SizeConfig.blockSizeVertical * 3,
            left: 25,
            right: 25,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildCircleIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
