import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lang/en_us.dart';
import 'lang/ja_jp.dart';
import 'lang/tr_tr.dart';
import 'lang/zh_hk.dart';

class MyTranslations extends Translations {
  // Default locale
  final locale = Locale((Get.find<SharedPreferences>().getString('locale') ??
          Get.deviceLocale?.languageCode) ??
      'en');

  // fallbackLocale saves the day when the locale gets in trouble
  final fallbackLocale = Locale('en');

  // Supported languages
  // Needs to be same order with locales
  final langs = ['English', 'Türkçe', '日本語', '繁體中文'];

  // Supported locales
  // Needs to be same order with langs
  final locales = [
    Locale('en', 'US'),
    Locale('tr', 'TR'),
    Locale('ja', 'JP'),
    Locale('zh', 'HK'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'tr_TR': trTR,
        'ja_JP': jaJP,
        'zh_HK': zhHK,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.find<SharedPreferences>().setString('locale', locale.languageCode);
      Get.updateLocale(locale);
    }
  }

  String? getLanguageFromLanguageCode(String? languageCode) {
    for (int i = 0; i < locales.length; i++) {
      if (languageCode == locales[i].languageCode) return langs[i];
    }
    return null;
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
