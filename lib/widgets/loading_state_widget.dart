import 'package:flutter/material.dart';
import 'package:matches/consts/app_colors.dart';

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: AppColors.accentColor,
    ));
  }
}
