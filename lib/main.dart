import 'package:flutter/material.dart';
import 'package:matches/consts/app_colors.dart';
import 'package:matches/consts/app_font_sizes.dart';
import 'package:matches/consts/constants.dart';
import 'package:matches/locator.dart';
import 'package:matches/screens/preloader_screen.dart';

void main() {
  setup();
  runApp(const MatchesApp());
}

class MatchesApp extends StatelessWidget {
  const MatchesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Constants.appName,
        theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: AppColors.backgroundColor,
            fontFamily: Constants.appFontFamily,
            appBarTheme: AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              color: AppColors.secondaryColor,
            ),
            textTheme: TextTheme(
                labelSmall: TextStyle(
                    color: AppColors.accentColor,
                    fontStyle: FontStyle.italic,
                    letterSpacing: -0.2,
                    fontSize: AppFontSizes.big),
                bodySmall: TextStyle(
                    fontSize: AppFontSizes.small, fontWeight: FontWeight.w400),
                bodyMedium: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: AppFontSizes.medium),
                bodyLarge: TextStyle(
                    fontSize: AppFontSizes.extraBig,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700))),
        home: PreloaderScreen());
  }
}
