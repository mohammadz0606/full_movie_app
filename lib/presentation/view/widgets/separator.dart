import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/themes/app_colors.dart';

class CustomSeparator extends StatelessWidget {
  const CustomSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      width: 80.w,
      padding: EdgeInsets.only(
        top: 2.h,
        bottom: 6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(1.h),
        ),
        gradient: const LinearGradient(
          colors: [
            AppColor.violet,
            AppColor.royalBlue,
          ],
        )
      ),
    );
  }
}
