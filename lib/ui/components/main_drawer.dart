import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical * 15,
              child: Center(
                child: SvgPicture.asset('assets/ppLogo.svg'),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.home_outlined,
                size: SizeConfig.blockSizeHorizontal * 6,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.search,
                size: SizeConfig.blockSizeHorizontal * 6,
              ),
              title: Text(
                'Browse',
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.help_outline,
                size: SizeConfig.blockSizeHorizontal * 6,
              ),
              title: Text(
                'How it works',
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.info,
                size: SizeConfig.blockSizeHorizontal * 6,
              ),
              title: Text(
                'About',
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.person,
                size: SizeConfig.blockSizeHorizontal * 6,
              ),
              title: Text(
                'Contact',
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
