import 'package:flutter/material.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class AlbumCard extends StatelessWidget {
  final String imgUrl;
  AlbumCard(this.imgUrl);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 30,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 30,
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Some Group',
                style: TextStyle(
                  color: Constants.lightGrey,
                  fontFamily: 'HKGrostesk',
                  fontSize: SizeConfig.blockSizeHorizontal * 3,
                ),
              ),
              Text(
                'Some Album',
                style: TextStyle(
                  color: Constants.textColor,
                  fontFamily: 'HKGrostesk',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
