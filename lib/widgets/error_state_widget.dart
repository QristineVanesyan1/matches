import 'package:flutter/material.dart';
import 'package:matches/consts/app_colors.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Icon(
      Icons.error,
      color: AppColors.accentColor,
      size: 50,
    ));
  }
}
