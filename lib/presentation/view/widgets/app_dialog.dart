import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/themes/app_colors.dart';
import 'button.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.image,
  }) : super(key: key);
  final String title, description, buttonText;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.vulcan,
      elevation: 32,
      insetPadding: const EdgeInsets.all(32),
      content: Container(
        padding: EdgeInsets.only(
          top: 4.h,
          left: 16.w,
          right: 16.w,
        ),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.vulcan,
              blurRadius: 16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
            ),
            image,
            Button(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
