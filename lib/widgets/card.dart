import 'package:flutter/material.dart';
import 'package:matches/consts/app_colors.dart';
import 'package:matches/consts/constants.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {required this.child,
      this.padding = const EdgeInsets.all(10),
      this.radius = Constants.defRadius,
      this.color = AppColors.secondaryColor,
      Key? key})
      : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final Color color;

  const CardWidget.small({Key? key, required this.child})
      : this.padding =
            const EdgeInsets.only(top: 6, left: 20, right: 16, bottom: 6),
        this.radius = Constants.smallRadius,
        this.color = AppColors.primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
