import 'package:flutter/material.dart';

class Constants {
  static const String COMFORTAA = "Comfortaa";
  static const BorderSide BLACK_BORDER_SIDE = BorderSide(
    width: 2.0,
    color: Colors.black,
  );
  static const String HAS_NEXT = "has_next";
  static const String DATA = "data";
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
