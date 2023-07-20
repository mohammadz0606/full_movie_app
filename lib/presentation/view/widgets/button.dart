import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/themes/app_colors.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColor.royalBlue,
            AppColor.violet,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.w),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.symmetric(vertical: 9.h, horizontal: 35.w),
      height: 25.h,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
        },
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge!,
          ),
        ),
      ),
    );
  }
}
