import 'package:flutter/material.dart';
import 'package:matches/consts/app_colors.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No result',
        style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.28,
            color: AppColors.emperorColor),
      ),
    );
  }
}
