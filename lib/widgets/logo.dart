import 'package:flutter/material.dart';
import 'package:matches/consts/app_images.dart';

class Logo extends StatelessWidget {
  const Logo({this.size = const Size(60, 60), Key? key}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child:
          FittedBox(fit: BoxFit.contain, child: Image.asset(AppImages.appLogo)),
    );
  }
}
