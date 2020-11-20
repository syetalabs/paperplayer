import 'package:flutter/material.dart';
import 'package:paperplayer/ui/components/appbar_subscreens.dart';
import 'package:paperplayer/util/constants.dart';

class HowItWorks extends StatelessWidget {
  static const routeName = '/drawer-how';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: AppBarSubScreens(title: 'How It Works'),
      body: Container(),
    );
  }
}
