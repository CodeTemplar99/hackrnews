import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;
  static Orientation orientation = Orientation.portrait;
  static bool isTablet = false;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    bool isTablet = _mediaQueryData.size.shortestSide >= 600;
    SizeConfig.isTablet = isTablet;
  }
}

// get height per mobile screen size
double getProportionateMobileHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 800.0) * screenHeight;
}

// get width per mobile screen size
double getProportionateMobileWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 360.0) * screenWidth;
}

// add free space vertically on mobile
class VerticalSpacingMobile extends StatelessWidget {
  const VerticalSpacingMobile({Key? key, required this.heightValue})
      : super(key: key);
  final double heightValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightValue,
    );
  }
}

//button border radius
double buttonBorderRadius = getProportionateMobileHeight(12);

//button border radius
double cardBorderRadiusSm = getProportionateMobileHeight(5);
//button border radius
double cardBorderRadiusLg = getProportionateMobileHeight(10);
