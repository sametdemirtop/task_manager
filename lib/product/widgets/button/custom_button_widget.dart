import 'package:flutter/material.dart';

import '../../constant/color_constant.dart';
import '../../utils/size/size_utils.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final bool? isActive;
  final bool? hasIcon;
  final IconData? withIcon;
  final Color? colorButton;
  final VoidCallback? onPressed;

  CustomButton(
      {super.key,
      this.text,
      this.onPressed,
      this.colorButton,
      this.isActive,
      this.withIcon,
      this.hasIcon});

  final ResponsiveUtil _responsiveUtil = ResponsiveUtil();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _responsiveUtil.height(context, percentage: 0.1),
      width: _responsiveUtil.width(context, percentage: 0.9),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton ??
              (isActive!
                  ? withIcon != null
                      ? (withIcon != Icons.add
                          ? ColorConstant.onBoardButtonColor
                          : ColorConstant.blackTextFieldInput)
                      : ColorConstant.blackTextFieldInput
                  : ColorConstant.grayTextFieldInput),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_responsiveUtil.width(context,
                percentage: 0.05)), // Köşe radius
          ),
        ),
        onPressed: isActive! ? onPressed : () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: hasIcon!,
              child: Padding(
                padding:
                    _responsiveUtil.paddingRight(context, percentage: 0.01),
                child: Icon(
                  withIcon,
                  size: _responsiveUtil.width(context, percentage: 0.07),
                  color: withIcon != Icons.add
                      ? ColorConstant.blackTextFieldInput
                      : ColorConstant.whiteButtonInput,
                ),
              ),
            ),
            Text(
              text!,
              style: TextStyle(
                  fontSize: _responsiveUtil.height(context, percentage: 0.021),
                  color: withIcon != null
                      ? (withIcon != Icons.add
                          ? ColorConstant.blackTextFieldInput
                          : ColorConstant.whiteButtonInput)
                      : ColorConstant.whiteButtonInput,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
