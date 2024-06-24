import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color grayTextFieldInput = fromHex('#9E9E9E');
  static Color blackTextFieldInput = fromHex('#0d1628');
  static Color blueTextButtonInput = fromHex('#0094ff');
  static Color whiteButtonInput = fromHex('#ffffff');
  static Color onBoardButtonColor = fromHex('#e8eaec');
  static Color redColor = fromHex('#EF5350');
  static Color blueColor = fromHex('#2196F3');
  static Color orangeColor = fromHex('#FFA500');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
