import 'package:flutter/material.dart';
import 'package:paperplayer/ui/components/appbar_subscreens.dart';
import 'package:paperplayer/util/constants.dart';

class Collection extends StatelessWidget {
  static const routeName = '/user-collection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: AppBarSubScreens(title: 'Collection', directionRight: false),
      body: Container(),
    );
  }
}
