import 'dart:async';

import 'package:mart_map/presentation/utils/l10n/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeLocalization(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get appName {
    return Intl.message('MartMap', name: 'app_name');
  }

  String get insertCategory {
    return Intl.message('Введите категорию...', name: 'insert_category');
  }

  String get reviews {
    return Intl.message('Отзывы', name: 'reviews');
  }

  String get filtrationAndSorting {
    return Intl.message('Фильтрация и сортировка', name: 'filtration_and_sorting');
  }

  String get sortingBy {
    return Intl.message('Сортировать по: ', name: 'sorting_by');
  }

  String get select {
    return Intl.message('Выбрать', name: 'select');
  }

  String get sex {
    return Intl.message('Пол: ', name: 'sex');
  }

  String get size {
    return Intl.message('Возраст: ', name: 'size');
  }

  String get reset {
    return Intl.message('Сбросить', name: 'reset');
  }

  String get sortingNumAZ {
    return Intl.message('Номер A-Я', name: 'sorting_num_az');
  }

  String get sortingNumZA {
    return Intl.message('Номер Я-A', name: 'sorting_num_za');
  }

  String get sortingNameAZ {
    return Intl.message('Название А-Я', name: 'sorting_name_az');
  }

  String get sortingNameZA {
    return Intl.message('Название Я-А', name: 'sorting_name_za');
  }

  String get sexFemale {
    return Intl.message('Женский', name: 'sex_female');
  }

  String get sexMale {
    return Intl.message('Мужской', name: 'sex_male');
  }

  String get sizeChild {
    return Intl.message('Ребенок', name: 'size_ child');
  }

  String get sizeAdult {
    return Intl.message('Взрослый', name: 'size_adult');
  }

}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
