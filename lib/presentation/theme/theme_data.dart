import 'package:flutter/material.dart';
import 'package:tortoise_assignment/presentation/theme/base_colors.dart';

final appThemeData = ThemeData(
  scaffoldBackgroundColor: BaseColors.white,
  primaryColor: BaseColors.primaryColor,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: BaseColors.black),
    foregroundColor: BaseColors.transparent,
    backgroundColor: BaseColors.transparent,
    surfaceTintColor: BaseColors.transparent,
    elevation: 0.0,
    centerTitle: false,
  ),
  elevatedButtonTheme: _elevatedButtonTheme(),
  outlinedButtonTheme: _outlinedButtonTheme(),
  textSelectionTheme: _textSelectionThemeData(),
  tabBarTheme: const TabBarThemeData(
    indicatorColor: BaseColors.primaryColor,
    labelColor: BaseColors.primaryColor,
    indicatorSize: TabBarIndicatorSize.tab,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: BaseColors.primaryColor,
  ),
);

ElevatedButtonThemeData _elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: BaseColors.primaryColor,
      foregroundColor: BaseColors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // disabledBackgroundColor: BaseColors.disabledBackground.withValues(
      //   alpha: 0.4,
      // ),
      // disabledForegroundColor: BaseColors.disableText.withValues(alpha: 0.4),
      elevation: 0,
    ),
  );
}

OutlinedButtonThemeData _outlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: BaseColors.primaryColor,
      // side: BorderSide(color: BaseColors.borderGrey2, width: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}

TextSelectionThemeData _textSelectionThemeData() {
  return const TextSelectionThemeData(
    cursorColor: BaseColors.primaryColor,
    selectionHandleColor: BaseColors.primaryColor,
  );
}
