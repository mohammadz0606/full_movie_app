import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../view_model/language.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final Function() onTap;
  const NavigationListItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!,
        ),
      ),
    );
  }
}

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final int index;

  const NavigationSubListItem({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 2,
          ),
        ],
      ),
      child: Consumer<LanguageProvider>(
        builder: (context, provider, child) {
          return ListTile(
            onTap: () {
              provider.changeLang(index);
            },
            contentPadding: EdgeInsets.symmetric(horizontal: 32.w),
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!,
            ),
          );
        },
      ),
    );
  }
}
