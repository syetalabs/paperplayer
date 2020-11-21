import 'package:flutter/material.dart';
import 'package:paperplayer/data/models/genre_data.dart';

class Constants {
  static const Color primaryColor = Color(0xff006386);
  static const Color backgroundColor = Color(0xffEDE9E1);
  static const Color primaryTextColor = Color(0xff102e3e);
  static const Color darkTextColor = Color(0xff040415);
  static const Color darkGrey = Color(0xff707070);
  static const Color lightGrey = Color(0xffA0A0A0);
  static const Color textColor = Color(0xff212121);
  static const Color browseGrey = Color(0xff5F5F5F);
  static const Color tagYellow = Color(0xffF8BC3F);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffEEEEEE);
  static const Color green = Color(0xff388E3C);

  List<GenreData> getGenreList() {
    List<GenreData> list = [
      GenreData('Latin', Color(0xffE64A19).withOpacity(0.75)),
      GenreData('Rock', Color(0xffEF6C00).withOpacity(0.75)),
      GenreData('Pop', Color(0xffF9A825).withOpacity(0.75)),
      GenreData('Dance', Color(0xff9E9D24).withOpacity(0.75)),
      GenreData('Country', Color(0xff558B2F).withOpacity(0.75)),
      GenreData('Metal', Color(0xff2E7D32).withOpacity(0.75)),
      GenreData('EDM', Color(0xff00695C).withOpacity(0.75)),
      GenreData('Trance', Color(0xff00838F).withOpacity(0.75)),
      GenreData('Trap', Color(0xff00838F).withOpacity(0.75)),
      GenreData('Hip Hop', Color(0xff0277BD).withOpacity(0.75)),
    ];
    return list;
  }
}
