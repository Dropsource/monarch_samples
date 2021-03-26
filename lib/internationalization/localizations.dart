import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart'
    show BuildContext, Locale, Localizations, LocalizationsDelegate;
import 'package:monarch_annotations/monarch_annotations.dart';

final Locale _english = Locale('en', 'US');
final Locale _spanish = Locale('es', 'ES');

@MonarchLocalizations([MonarchLocale('en', 'US'), MonarchLocale('es', 'ES')])
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
    this.supportedLocales = const [Locale('en', 'US')],
    this.defaultLocale,
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

  static SampleLocalizations of(BuildContext context) {
    return Localizations.of<SampleLocalizations>(context, SampleLocalizations);
  }

  SampleLocalizations(this.locale);

  /// Used to translate a [key] in the current dictionary.
  String text(String key) {
    return _localizedValues[key] ?? '_$key';
  }

  static Future<SampleLocalizations> load(
    Locale locale,
    TranslationsBundleLoader loader,
  ) async {
    SampleLocalizations translations = SampleLocalizations(locale);
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
  final AssetBundle bundle; // Defaults to rootBundle if none provided
  FileTranslationsBundleLoader(this.path, {this.bundle}) : super();

  @override
  Future<Map<String, dynamic>> loadTranslationsDictionary(Locale locale) async {
    String jsonContent = await (bundle ?? rootBundle)
        .loadString('$path/i18n_${locale.languageCode}.json');
    return json.decode(jsonContent);
  }
}
