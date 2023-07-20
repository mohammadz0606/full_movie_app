import 'dart:developer';

import 'package:flutter/material.dart';


class LanguageProvider extends ChangeNotifier {
  int indexLang = 0;

  void changeLang(int index) {
    if (index == 0) {
      indexLang = 0;
    } else if (index == 1) {
      indexLang = 1;
    } else if (index == 2) {
      indexLang = 2;
    }
    log(indexLang.toString());
    notifyListeners();
  }
}
