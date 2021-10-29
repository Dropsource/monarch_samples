/// Monarch Internationalization Documentation:
/// https://monarchapp.io/docs/internationalization

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart'
    show BuildContext, Locale, Localizations, LocalizationsDelegate;
import 'package:monarch_annotations/monarch_annotations.dart';

const _english = Locale('en', 'US');
const _spanish = Locale('es', 'US');

@MonarchLocalizations([MonarchLocale('en', 'US'), MonarchLocale('es', 'US')])
final SampleLocalizationsDelegate localizationDelegate =
    SampleLocalizationsDelegate(
  FileTranslationsBundleLoader('locale'),
  supportedLocales: [_english, _spanish],
  defaultLocale: _english,
);

class SampleLocalizationsDelegate
    extends LocalizationsDelegate<SampleLocalizations> {
  final TranslationsBundleLoader bundleLoader;
  final Locale defaultLocale;
  final List<Locale> supportedLocales;

  const SampleLocalizationsDelegate(
    this.bundleLoader, {
    this.supportedLocales = const [_english, _spanish],
    required this.defaultLocale,
  });

  List<String> get supportedLanguages =>
      supportedLocales.map((l) => l.languageCode).toList();

  @override
  bool isSupported(Locale locale) =>
      supportedLanguages.contains(locale.languageCode);

  @override
  Future<SampleLocalizations> load(Locale locale) =>
      SampleLocalizations.load(locale, bundleLoader);

  @override
  bool shouldReload(SampleLocalizationsDelegate old) => false;
}

class SampleLocalizations {
  Locale locale;

  static Map<String, dynamic> _localizedValues = <String, dynamic>{};

  static SampleLocalizations? of(BuildContext context) {
    return Localizations.of<SampleLocalizations>(context, SampleLocalizations);
  }

  SampleLocalizations(this.locale);

  String text(String key) {
    return _localizedValues[key] ?? '_$key';
  }

  static Future<SampleLocalizations> load(
    Locale locale,
    TranslationsBundleLoader loader,
  ) async {
    var translations = SampleLocalizations(locale);
    _localizedValues = await loader.loadTranslationsDictionary(locale);
    return translations;
  }

  String get currentLanguage => locale.languageCode;
}

abstract class TranslationsBundleLoader {
  TranslationsBundleLoader();

  Future<Map<String, dynamic>> loadTranslationsDictionary(Locale locale);
}

class FileTranslationsBundleLoader extends TranslationsBundleLoader {
  final String path;
  final AssetBundle? bundle;
  FileTranslationsBundleLoader(this.path, {this.bundle}) : super();

  @override
  Future<Map<String, dynamic>> loadTranslationsDictionary(Locale locale) async {
    var jsonContent = await (bundle ?? rootBundle)
        .loadString('$path/i18n_${locale.languageCode}.json');
    return json.decode(jsonContent);
  }
}
