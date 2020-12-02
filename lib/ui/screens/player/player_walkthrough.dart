import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:paperplayer/ui/screens/training/player_training_intro.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class PlayerWalkThrough extends StatefulWidget {
  static const routeName = '/player_Playerwalkthrough_screen';
  @override
  _PlayerWalkThroughState createState() => _PlayerWalkThroughState();
}

class _PlayerWalkThroughState extends State<PlayerWalkThrough> {

  ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);
  PageController _pageController = PageController();

  final List<String> _titlesList = [
    'Welcome to PaperPlayer.',
    '1-Set your phone in a Horizontal Stand.',
    '2-Show us your Album',
    '3-Sit back and Listen',
  ];

  final List<String> _subtitlesList = [
    'Here’s how Beta 0.3.1 works…',
    '(Alexa & Google Device versions out soon)',
    '(Hint: This Beta version only likes the world’s greatest Comeback Album )',
    '(PaperPlayer can remember which tracks you prefer to skip )',
  ];

  final List<String> _imageList = [
    'assets/pl1.png',
    'assets/pl2.png',
    'assets/pl3.png',
    'assets/pl4.png',
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
            width: 30,
            height: 30,
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
            ),
          ),
        ) : SizedBox(width: 30),
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
            width: 30,
            height: 30,
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ),
        ) : SizedBox(width: 30),
      ],
    );
  }

  Widget getPage(
      String image, String title, String subTitle, BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: SizeConfig.safeBlockVertical * 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.safeBlockVertical * 20,
                    ),
                    boxShadow: [
                      if(title.startsWith('1'))
                        BoxShadow(
                          color: Constants.darkGrey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 17,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                    ]
                ),
                child: title[0]=='1'
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(
                    SizeConfig.safeBlockVertical * 20,
                  ),
                  child: Image.asset(image),
                ) : Image.asset(image),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 5,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w800,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  subTitle,
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    color: Constants.darkTextColor,
                    fontSize: SizeConfig.blockSizeHorizontal * 2.5,
                    fontStyle: FontStyle.normal,
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    setState(() {
      _currentPageNotifier = ValueNotifier<int>(0);
    });
  }

  @override
  dispose() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SingleChildScrollView(
            child:  SizedBox(
              height: SizeConfig.screenHeight,
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
                  getPage(_imageList[3], _titlesList[3],
                      _subtitlesList[3], context),
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
            bottom: SizeConfig.blockSizeVertical* 19,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildCircleIndicator(),
            ),
          ),
          Positioned(
            right: 15,
            bottom:10,
            child: Container(
              width: SizeConfig.safeBlockVertical * 40,
              child: SvgPicture.asset(
                'assets/ppLogo.svg',
                color: Constants.textColor.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
