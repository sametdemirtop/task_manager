import 'package:flutter/material.dart';

import '../../constant/color_constant.dart';
import '../../utils/size/size_utils.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.obscureText,
    this.hintText,
    this.contentPaddingPercentage,
    this.onEditingCompleteCallback,
    this.suffix,
    this.hintSize,
    this.textEditingController,
    super.key,
  });

  final String? hintText;
  final double? contentPaddingPercentage;
  final double? hintSize;
  final bool? obscureText;
  final Widget? suffix;
  final TextEditingController? textEditingController;
  final void Function(String text)? onEditingCompleteCallback;

  final ResponsiveUtil _responsiveUtil = ResponsiveUtil();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
          fontSize:
              _responsiveUtil.height(context, percentage: hintSize ?? 0.018),
          color: ColorConstant.blackTextFieldInput,
          fontWeight: FontWeight.w600),
      obscureText: obscureText!,
      controller: textEditingController,
      onChanged: onEditingCompleteCallback,
      decoration: InputDecoration(
          hintText: hintText!,
          suffix: suffix,
          contentPadding: _responsiveUtil.paddingLeft(context,
              percentage: contentPaddingPercentage ?? 0.05),
          hintStyle: TextStyle(
              fontSize: _responsiveUtil.height(context,
                  percentage: hintSize ?? 0.018),
              color: ColorConstant.grayTextFieldInput,
              fontWeight: hintSize != null ? FontWeight.w400 : FontWeight.w600),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: ColorConstant.grayTextFieldInput,
                width: _responsiveUtil.height(context, percentage: 0.0008)),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: ColorConstant.grayTextFieldInput,
                width: _responsiveUtil.height(context, percentage: 0.0008)),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: ColorConstant.grayTextFieldInput,
                width: _responsiveUtil.height(context, percentage: 0.0008)),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: ColorConstant.grayTextFieldInput,
                width: _responsiveUtil.height(context, percentage: 0.0008)),
          )),
    );
  }
}
