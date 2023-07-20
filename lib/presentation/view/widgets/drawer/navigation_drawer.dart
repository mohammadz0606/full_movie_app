import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wiredash/wiredash.dart';

import '../../../../helper/languages/app_localization.dart';
import '../../../../helper/languages/language_list.dart';
import '../../../../helper/languages/translation_constants.dart';
import '../app_dialog.dart';
import '../logo.dart';
import 'navigation_expanded_list_item.dart';
import 'navigation_list_item.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      width: 300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 18.h,
                left: 8.w,
                right: 8.w,
              ),
              child: LogoApp(
                height: 50.h,
              ),
            ),
            NavigationListItem(
              title: AppLocalization.of(context)
                  .translate(TranslationConstants.favoriteMovies)!,
              onTap: () {},
            ),
            NavigationExpandedListItem(
              title: AppLocalization.of(context)
                  .translate(TranslationConstants.language)!,
              children: languages.map((e) => e.value).toList(),
            ),
            NavigationListItem(
              title: AppLocalization.of(context)
                  .translate(TranslationConstants.feedback)!,
              onTap: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show(inheritMaterialTheme: true);
              },
            ),
            NavigationListItem(
              title: AppLocalization.of(context)
                  .translate(TranslationConstants.about)!,
              onTap: () async {
                Navigator.of(context).pop();
                await _showDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AppDialog(
          title: AppLocalization.of(context)
              .translate(TranslationConstants.about)!,
          buttonText:
              AppLocalization.of(context).translate(TranslationConstants.okay)!,
          image: Image.asset(
            "assets/pngs/tmdb_logo.png",
            height: 50.h,
          ),
          description: AppLocalization.of(context)
              .translate(TranslationConstants.aboutDescription)!,
        );
      },
    );
  }
}
