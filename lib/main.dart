import 'package:flutter/material.dart';
import 'package:paperplayer/ui/screens/dashboard/browse_screen.dart';
import 'package:paperplayer/ui/screens/dashboard/home.dart';

import 'ui/screens/onboarding/walkthrough.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WalkThrough(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        BrowseScreen.routeName: (ctx) => BrowseScreen(),
      },
    );
  }
}
