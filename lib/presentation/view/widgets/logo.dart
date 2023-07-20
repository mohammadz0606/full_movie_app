import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoApp extends StatelessWidget {
  final double height;

  const LogoApp({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/pngs/logo.png",
      color: Colors.white,
      height: height.h,
    );
  }
}
