import 'package:flutter/material.dart';
import 'package:paperplayer/ui/components/appbar_subscreens.dart';
import 'package:paperplayer/util/constants.dart';

class Personal extends StatelessWidget {
  static const routeName = '/user-personal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: AppBarSubScreens(title: 'Personal', directionRight: false),
      body: Container(),
    );
  }
}
