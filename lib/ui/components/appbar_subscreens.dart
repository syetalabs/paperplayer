import 'package:flutter/material.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class AppBarSubScreens extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool directionRight;
  const AppBarSubScreens({
    this.title,
    this.directionRight = true,
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical*14,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          AppBar(
            elevation: 5,
            backgroundColor: Constants.backgroundColor,
            leading: Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  directionRight
                      ? Icons.arrow_forward_outlined
                      : Icons.arrow_back_outlined,
                  color: Constants.black,
                )
              ),
            ),
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(
                color: Constants.darkTextColor,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w300,
                fontSize: SizeConfig.blockSizeHorizontal * 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
