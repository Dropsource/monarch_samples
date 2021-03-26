import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart'
    show BuildContext, Locale, Localizations, LocalizationsDelegate;
import 'package:monarch_annotations/monarch_annotations.dart';

final Locale _english = Locale('en', 'US');
final Locale _spanish = Locale('es', 'ES');

@MonarchLocalizations([MonarchLocale('en', 'US'), MonarchLocale('es', 'ES')])
final TranslationsDelegate localizationDelegate = TranslationsDelegate(
  FileTranslationsBundleLoader('locale'),
  supportedLocales: [_english, _spanish],
  defaultLocale: _english,
);

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

abstract class TranslationsBundleLoader {
  TranslationsBundleLoader();

  Future<Map<String, dynamic>> loadTranslationsDictionary(Locale locale);
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  final TranslationsBundleLoader bundleLoader;
  final Locale defaultLocale;
  final List<Locale> supportedLocales;

  const TranslationsDelegate(
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
  Future<Translations> load(Locale locale) =>
      Translations.load(locale, bundleLoader);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}

class Translations {
  Locale locale;

  static Map<String, dynamic> _localizedValues = <String, dynamic>{};

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  Translations(this.locale);

  /// Used to translate a [key] in the current dictionary.
  String text(String key) {
    return _localizedValues[key] ?? '_$key';
  }

  static Future<Translations> load(
    Locale locale,
    TranslationsBundleLoader loader,
  ) async {
    Translations translations = Translations(locale);
    _localizedValues = await loader.loadTranslationsDictionary(locale);
    return translations;
  }

  String get currentLanguage => locale.languageCode;
}
