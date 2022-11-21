import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mova/core/resources/colors_manager.dart';
import 'package:mova/core/resources/fonts_manager.dart';
import 'package:mova/core/resources/styles_manager.dart';
import 'package:mova/core/resources/values_manager.dart';

ThemeData getApplicationDarkTheme() {
  return ThemeData(
    // Scaffold
    scaffoldBackgroundColor: ColorsManager.sBlack,

    // AppBar
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      backgroundColor: ColorsManager.sBlack,
      iconTheme: const IconThemeData(color: ColorsManager.mainWhiteColor),
      titleTextStyle: getSemiBoldStyle(
          fontName: FontsName.generalFont, fontSize: FontsSize.s18),
    ),

    // Swatch color
    primarySwatch: ColorsManager.swatchRed,

    // Text Themes
    textTheme: TextTheme(
      // Movies name
      titleLarge: getBoldStyle(
          fontName: FontsName.moviesNameFont, fontSize: FontsSize.s18),
      titleMedium: getSemiBoldStyle(
          fontName: FontsName.moviesNameFont, fontSize: FontsSize.s14),
      titleSmall: getMediumStyle(
          fontName: FontsName.moviesNameFont, fontSize: FontsSize.s12),

      // Movies details
      bodyLarge: getRegularStyle(
          fontName: FontsName.detailsFont, fontSize: FontsSize.s16),
      bodyMedium: getMediumStyle(
          fontName: FontsName.detailsFont, fontSize: FontsSize.s14),
      bodySmall: getLightStyle(
          fontName: FontsName.detailsFont, fontSize: FontsSize.s12),

      // General Font
      headlineSmall: getRegularStyle(
          fontName: FontsName.generalFont, fontSize: FontsSize.s16),
      headlineMedium: getSemiBoldStyle(
          fontName: FontsName.generalFont, fontSize: FontsSize.s14),
      headlineLarge: getBoldStyle(
          fontName: FontsName.generalFont, fontSize: FontsSize.s16),
    ),

    // Text Form Field theme
    inputDecorationTheme: InputDecorationTheme(
      focusColor: ColorsManager.tffEnabled,
      fillColor: ColorsManager.tffBackground,
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DoubleManager.d_8)),
      contentPadding: const EdgeInsets.all(DoubleManager.d_12),
      hintStyle: getSemiBoldStyle(
          fontName: FontsName.generalFont,
          color: ColorsManager.gGrey,
          fontSize: DoubleManager.d_14),
      labelStyle: getRegularStyle(
          fontName: FontsName.generalFont,
          color: ColorsManager.swatchRed,
          fontSize: DoubleManager.d_14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DoubleManager.d_8),
        borderSide: const BorderSide(),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DoubleManager.d_8),
        borderSide: const BorderSide(color: ColorsManager.swatchRed),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DoubleManager.d_8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DoubleManager.d_8),
      ),
      prefixIconColor: ColorsManager.gGrey,
      suffixIconColor: ColorsManager.gGrey,
      errorStyle: getMediumStyle(
          fontName: FontsName.generalFont,
          color: ColorsManager.mainRedColor,
          fontSize: DoubleManager.d_14),
    ),
    // Icons
    iconTheme: const IconThemeData(
        size: DoubleManager.d_20, color: ColorsManager.swatchRed),

    // Checkbox
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DoubleManager.d_5)),
      side: const BorderSide(
        style: BorderStyle.solid,
        color: ColorsManager.swatchRed,
        width: DoubleManager.d_2,
      ),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size(double.infinity, DoubleManager.d_45),
        textStyle: getSemiBoldStyle(
            fontName: FontsName.generalFont, fontSize: DoubleManager.d_16),
      ),
    ),
  );
}
