import 'package:flutter/material.dart';

class CustomText {
  static Text createNormalText(
    String text, {
    double? size,
    Color? color,
    String? fontFamily,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        color: color,
      ),
    );
  }

  static Text createItalicText(
    String text, {
    double? size,
    Color? color,
    String? fontFamily,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        fontStyle: FontStyle.italic,
        color: color,
      ),
    );
  }

  static Text createBoldText(
    String text, {
    double? size,
    Color? color,
    FontWeight? fontWeight,
    String? fontFamily,
  }) {
    return Text(
      text,
      style: TextStyle(
        // Roboto is the default font of the Material style
        // fontFamily: 'Roboto',
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.w900, color: color,
      ),
    );
  }
}
