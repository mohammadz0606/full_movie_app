import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'language_list.dart';

class AppLocalization {
  final Locale locale;
  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationsDelegates();

  static AppLocalization of(context) =>
      Localizations.of(context, AppLocalization);

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    final jsonString = await rootBundle
        .loadString('assets/languages/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }

  String? translate(String key) {
    return _localizedStrings[key];
  }

  AppLocalization({
    required this.locale,
  });
}

class _AppLocalizationsDelegates
    extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationsDelegates();

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) => e.code).contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = AppLocalization(locale: locale);
    await appLocalization.load();
    return appLocalization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
