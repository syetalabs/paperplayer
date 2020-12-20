import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperplayer/data/repositories/login_repository.dart';
import 'package:paperplayer/ui/screens/dashboard/browse_screen.dart';
import 'package:paperplayer/ui/screens/dashboard/home.dart';
import 'package:paperplayer/ui/screens/main_drawer/about.dart';
import 'package:paperplayer/ui/screens/main_drawer/contact.dart';
import 'package:paperplayer/ui/screens/main_drawer/how.dart';
import 'package:paperplayer/ui/screens/player/player_walkthrough.dart';
import 'package:paperplayer/ui/screens/training/camera.dart';
import 'package:paperplayer/ui/screens/training/player_training_intro.dart';
import 'package:paperplayer/ui/screens/user_drawer/cart.dart';
import 'package:paperplayer/ui/screens/user_drawer/collection.dart';
import 'package:paperplayer/ui/screens/user_drawer/personal.dart';
import 'cubit/login/login_cubit.dart';
import 'ui/screens/onboarding/walkthrough.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginRepo()),
      child: MyApp(),
    ),
  );
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
        TrainingIntro.routeName: (ctx) => TrainingIntro(),
        CameraScreen.routeName: (ctx) => CameraScreen(),
        HowItWorks.routeName: (ctx) => HowItWorks(),
        About.routeName: (ctx) => About(),
        Contact.routeName: (ctx) => Contact(),
        Collection.routeName: (ctx) => Collection(),
        Cart.routeName: (ctx) => Cart(),
        Personal.routeName: (ctx) => Personal(),
        PlayerWalkThrough.routeName: (ctx) => PlayerWalkThrough(),
      },
    );
  }
}
