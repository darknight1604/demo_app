import 'package:flutter/material.dart';

class RobotoText {
  static Text createNormalText(
    String text, {
    double? size,
    Color? color,
  }) {
    return Text(
      text,
      style: TextStyle(
        // Roboto is the default font of the Material style
        // fontFamily: 'Roboto',
        fontSize: size,
        color: color,
      ),
    );
  }

  static Text createItalicText(
    String text, {
    double? size,
    Color? color,
  }) {
    return Text(
      text,
      style: TextStyle(
        // Roboto is the default font of the Material style
        // fontFamily: 'Roboto',
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
  }) {
    return Text(
      text,
      style: TextStyle(
        // Roboto is the default font of the Material style
        // fontFamily: 'Roboto',
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.w900, color: color,
      ),
    );
  }
}
