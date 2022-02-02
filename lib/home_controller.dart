import 'package:first_flutter_app/my_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var _count = (Get.find<SharedPreferences>().getInt('count') ?? 0).obs;

  get count => _count;

  final _selectedLang = (Get.find<MyTranslations>()
              .getLanguageFromLanguageCode(Get.locale?.languageCode) ??
          Get.find<MyTranslations>().getLanguageFromLanguageCode(
              Get.find<MyTranslations>().fallbackLocale.languageCode))
      .obs;

  get selectedLangValue => _selectedLang.value;

  final _langs = Get.find<MyTranslations>().langs;

  void increment() {
    _count++;
    Get.find<SharedPreferences>().setInt('count', _count.value);
  }

  List<DropdownMenuItem<String>>? buildDropdownMenuItems() {
    return _langs.map((String lang) {
      return DropdownMenuItem(value: lang, child: Text(lang));
    }).toList();
  }

  void onChangedDropdownMenuItem(String? value) {
    _selectedLang.value = value;
    _changeLocale(value!);
  }

  void _changeLocale(String lang) {
    Get.find<MyTranslations>().changeLocale(lang);
  }
}
