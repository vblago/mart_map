import 'package:flutter/material.dart';
import 'package:mart_map/presentation/utils/localizations.dart';

class SearchParameters {
  String text;
  int sort;
  int sex;
  int size;

  List<String> sortDescriptions = new List();
  List<String> sexDescriptions = new List();
  List<String> sizeDescriptions = new List();

  SearchParameters(){
    sortDescriptions.add("Номер А-Я");
    sortDescriptions.add("Номер Я-А");
    sortDescriptions.add("Название А-Я");
    sortDescriptions.add("Название Я-А");
    sexDescriptions.add("Женский");
    sexDescriptions.add("Мужской");
    sizeDescriptions.add("Ребёнок");
    sizeDescriptions.add("Взрослый");
//    sortDescriptions.add(AppLocalizations.of(context).sortingNumAZ);
//    sortDescriptions.add(AppLocalizations.of(context).sortingNumZA);
//    sortDescriptions.add(AppLocalizations.of(context).sortingNameAZ);
//    sortDescriptions.add(AppLocalizations.of(context).sortingNameZA);
//    sexDescriptions.add(AppLocalizations.of(context).sexFemale);
//    sexDescriptions.add(AppLocalizations.of(context).sexMale);
//    sizeDescriptions.add(AppLocalizations.of(context).sizeChild);
//    sizeDescriptions.add(AppLocalizations.of(context).sizeAdult);
  }

  List<DropdownMenuItem<int>> getSortParameters() {
    List<DropdownMenuItem<int>> menuList = new List();
    for (int i = 0; i < 4; i++) {
      menuList.add(DropdownMenuItem<int>(
        value: i,
        child: new Text(
          sortDescriptions[i],
        ),
      ));
    }
    return menuList;
  }

  List<DropdownMenuItem<int>> getSexParameters() {
    List<DropdownMenuItem<int>> menuList = new List();
    for (int i = 0; i < 2; i++) {
      menuList.add(DropdownMenuItem<int>(
        value: i,
        child: new Text(
          sexDescriptions[i],
        ),
      ));
    }
    return menuList;
  }

  List<DropdownMenuItem<int>> getSizeParameters() {
    List<DropdownMenuItem<int>> menuList = new List();
    for (int i = 0; i < 2; i++) {
      menuList.add(DropdownMenuItem<int>(
        value: i,
        child: new Text(
          sizeDescriptions[i],
        ),
      ));
    }
    return menuList;
  }
}
