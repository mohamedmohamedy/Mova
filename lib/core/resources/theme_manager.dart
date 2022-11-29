import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
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
          fontName: FontsName.generalFont, fontSize: FontsSize.s25),
    ),

    // Text Form Field theme
    inputDecorationTheme: InputDecorationTheme(
      focusColor: ColorsManager.tffEnabled,
      fillColor: ColorsManager.tffBackground,
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DoubleManager.d_8.sp)),
      contentPadding: EdgeInsets.all(DoubleManager.d_8.sp),
      hintStyle: getSemiBoldStyle(
          fontName: FontsName.generalFont,
          color: ColorsManager.gGrey,
          fontSize: FontsSize.s14),
      labelStyle: getRegularStyle(
          fontName: FontsName.generalFont,
          color: ColorsManager.swatchRed,
          fontSize: FontsSize.s14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DoubleManager.d_8.sp),
        borderSide: const BorderSide(),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DoubleManager.d_8.sp),
        borderSide: const BorderSide(color: ColorsManager.swatchRed),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DoubleManager.d_8.sp),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DoubleManager.d_8.sp),
      ),
      prefixIconColor: ColorsManager.gGrey,
      suffixIconColor: ColorsManager.gGrey,
      errorStyle: getMediumStyle(
          fontName: FontsName.generalFont,
          color: ColorsManager.mainRedColor,
          fontSize: FontsSize.s14),
    ),
    // Icons
    iconTheme: IconThemeData(
        size: DoubleManager.d_18.sp, color: ColorsManager.swatchRed),

    // Checkbox
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DoubleManager.d_5.sp)),
      side: BorderSide(
        style: BorderStyle.solid,
        color: ColorsManager.swatchRed,
        width: DoubleManager.d_05.w,
      ),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: Size(double.infinity, DoubleManager.d_7.h),
        textStyle: getSemiBoldStyle(
            fontName: FontsName.generalFont, fontSize: FontsSize.s16),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          textStyle: getBoldStyle(
              fontName: FontsName.generalFont, fontSize: FontsSize.s12)),
    ),

    // Dialogs
    dialogBackgroundColor: ColorsManager.tffBackground,
    dialogTheme: DialogTheme(
      titleTextStyle: getRegularStyle(
          fontName: FontsName.generalFont, fontSize: FontsSize.s12),
    ),
  );
}
