import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

import '../../../helper/themes/app_colors.dart';

class WiredashApp extends StatelessWidget {
  const WiredashApp({
    Key? key,
    required this.child,
    required this.langCode,
  }) : super(key: key);

  final Widget child;
  final String langCode;

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: "movies-app-aaeyumy",
      secret: "yedEcYnQhsImNa7EKxMDRUGayXO6xO6n",
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(
          languageCode: langCode,
        ),
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: AppColor.vulcan,
      ),
      child: child,
    );
  }
}
