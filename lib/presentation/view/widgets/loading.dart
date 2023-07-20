import 'package:flutter/material.dart';

import '../../../helper/themes/app_colors.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
      ),
      child: const Align(
        alignment: Alignment.topCenter,
        child: LinearProgressIndicator(
          color: AppColor.royalBlue,
        ),
      ),
    );
  }
}
