import 'package:flutter/material.dart';

/*
Diese Klasse ist dazu da um alle Abstände zu berechnen, damit die App responsiv ist.
Sizes.width
 */

class Sizes{

  static late double width, height;
  static late double widthPercent, heightPercent;

  static late double paddingBig, paddingRegular, paddingSmall;
  static late double textSizeBig, textSizeRegular, textSizeSmall;

  static late double borderRadius;

  static late double iconsSize;

  void initialize(BuildContext context){
    //Um die Breite und die Höhe des Bildschirms zu bekommen
    MediaQueryData m = MediaQuery.of(context);

    width = m.size.width;
    height = m.size.height;
    widthPercent = width / 100;
    heightPercent = height / 100;

    paddingSmall = width / 31.25;
    paddingRegular = paddingSmall * 2;
    paddingBig = paddingRegular * 2;

    textSizeSmall = width / 25;
    textSizeRegular = width / 18.75;
    textSizeBig = width / 10;

    borderRadius = widthPercent * 4;

    iconsSize = widthPercent * 7;
  }

}