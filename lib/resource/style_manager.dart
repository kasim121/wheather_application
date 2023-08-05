import 'package:flutter/material.dart';

TextStyle fontNormalStyle() => const TextStyle(
    color: Colors.black,
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.normal);

  TextStyle fontLargeBoldStyle() {
    return const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                letterSpacing: 1.5,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              );
  }
    TextStyle fontLargeLightStyle() {
    return const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                letterSpacing: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              );
  }

// import 'package:flutter/material.dart';

// import 'font_manager.dart';

// TextStyle _getTextStyle(
//     double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
//   return TextStyle(
//       fontSize: fontSize,
//       fontFamily: fontFamily,
//       color: color,
//       fontWeight: fontWeight);
// }

// //Regular bold
// TextStyle getRegularBoldTextStyle(
//     {double fontSize = const FontSize.s14, required Color color}) {
//   return _getTextStyle(
//       fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
// } 
// //Regular medium
// TextStyle getRegularMediumTextStyle(
//     {double fontSize = FontSize.s14, required Color color}) {
//   return _getTextStyle(
//       fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
// }
// //Regular light
// TextStyle getRegularLightTextStyle(
//     {double fontSize = FontSize.s14, required Color color}) {
//   return _getTextStyle(
//       fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
// }


