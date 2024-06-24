import 'package:flutter/material.dart';

import '../../utils/size/size_utils.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final double? percentage;
  final Color? color;
  final TextAlign? textAlign;

  CustomText({
    super.key,
    this.text,
    this.textAlign,
    this.fontWeight,
    this.percentage,
    this.color,
  });

  final ResponsiveUtil _responsiveUtil = ResponsiveUtil();

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text!,
      overflow: TextOverflow.visible,
      style: TextStyle(
        fontSize: _responsiveUtil.height(context, percentage: percentage!),
        color: color,
        letterSpacing: 0,
        fontWeight: fontWeight,
        fontFamily: 'OpenSans',
      ),
    );
  }
}
