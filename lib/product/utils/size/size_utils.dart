import 'package:flutter/material.dart';

class ResponsiveUtil {
  // Private constructor
  ResponsiveUtil._privateConstructor();

  // Single instance
  static final ResponsiveUtil _instance = ResponsiveUtil._privateConstructor();

  // Factory constructor
  factory ResponsiveUtil() {
    return _instance;
  }

  // Method to get horizontal padding
  double horizontalPadding(BuildContext context, {double percentage = 0.05}) {
    return MediaQuery.of(context).size.width * percentage;
  }

  // Method to get vertical padding
  double verticalPadding(BuildContext context, {double percentage = 0.05}) {
    return MediaQuery.of(context).size.height * percentage;
  }

  // Method to get padding all
  EdgeInsets paddingAll(BuildContext context, {double percentage = 0.05}) {
    double paddingValue = MediaQuery.of(context).size.width * percentage;
    return EdgeInsets.all(paddingValue);
  }

  // Method to get padding only left
  EdgeInsets paddingLeft(BuildContext context, {double percentage = 0.05}) {
    double paddingValue = MediaQuery.of(context).size.width * percentage;
    return EdgeInsets.only(left: paddingValue);
  }

  // Method to get padding only right
  EdgeInsets paddingRight(BuildContext context, {double percentage = 0.05}) {
    double paddingValue = MediaQuery.of(context).size.width * percentage;
    return EdgeInsets.only(right: paddingValue);
  }

  // Method to get height
  double height(BuildContext context, {double percentage = 1.0}) {
    return MediaQuery.of(context).size.height * percentage;
  }

  // Method to get width
  double width(BuildContext context, {double percentage = 1.0}) {
    return MediaQuery.of(context).size.width * percentage;
  }
}
