import 'package:flutter/material.dart';
import 'package:paperplayer/ui/components/appbar_subscreens.dart';
import 'package:paperplayer/util/constants.dart';

class Cart extends StatelessWidget {
  static const routeName = '/user-cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: AppBarSubScreens(title: 'Cart', directionRight: false),
      body: Container(),
    );
  }
}
