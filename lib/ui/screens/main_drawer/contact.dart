import 'package:flutter/material.dart';
import 'package:paperplayer/ui/components/appbar_subscreens.dart';
import 'package:paperplayer/util/constants.dart';

class Contact extends StatelessWidget {
  static const routeName = '/drawer-contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: AppBarSubScreens(title: 'Contact'),
      body: Container(),
    );
  }
}
