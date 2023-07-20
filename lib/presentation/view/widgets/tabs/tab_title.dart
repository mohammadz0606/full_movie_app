import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helper/languages/app_localization.dart';
import '../../../../helper/themes/app_colors.dart';

class TabTitleWidget extends StatelessWidget {
  const TabTitleWidget({
    Key? key,
    required this.title,
    required this.onTab,
    required this.isSelected,
  }) : super(key: key);
  final String title;
  final Function() onTab;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              width: 1.h,
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
            ),
          ),
        ),
        child: Text(
          AppLocalization.of(context).translate(title)!,
          style: isSelected
              ? Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColor.royalBlue,
                    fontWeight: FontWeight.w600,
                  )
              : Theme.of(context).textTheme.titleMedium!,
        ),
      ),
    );
  }
}