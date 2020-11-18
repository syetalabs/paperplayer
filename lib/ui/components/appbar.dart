import 'package:flutter/material.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class CommanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommanAppBar({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      elevation: 0.0,
      backgroundColor: Constants.backgroundColor,
      leading: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 3),
        child: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: Constants.darkTextColor,
            size: 40,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        'paperplayer',
        style: TextStyle(
          color: Constants.darkTextColor,
          fontFamily: 'Metropolis',
          fontSize: SizeConfig.blockSizeHorizontal * 7,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 3),
          child: GestureDetector(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Constants.backgroundColor,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/user.jpg'),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
