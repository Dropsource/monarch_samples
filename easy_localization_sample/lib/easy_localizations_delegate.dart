import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monarch_annotations/monarch_annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/localization.dart';
import 'package:easy_localization/src/translations.dart';

class MyEasyLocalizationsDelegate extends LocalizationsDelegate<Localization> {
  const MyEasyLocalizationsDelegate();

  @override
  Future<Localization> load(Locale locale) async {
    var assetLoader = const RootBundleAssetLoader();
    // or use your own asset loader

    var data = await assetLoader.load('assets/translations', locale);
    var translations = Translations(data);

    Localization.load(locale, translations: translations);
    return Localization.instance;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Localization> old) => false;

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);
}

@MonarchLocalizations([MonarchLocale('en', 'US'), MonarchLocale('es')])
const myEasyLocalizationsDelegate = MyEasyLocalizationsDelegate();
