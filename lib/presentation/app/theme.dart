import 'package:flutter/material.dart';

class ThemeApp {
  ThemeData data;
  var facebookBtnColor;
  var appBarColor;
  var grey;

  ThemeApp() {
    data = ThemeData(
      bottomAppBarColor: Color(0xFF147AA8),
      primaryColorDark: Color(0xFF106285),
      primaryColor: Color(0xFF147AA8),
      accentColor: Color(0xFF147AA8),
    );
    appBarColor = Color(0xFF147AA8);
    facebookBtnColor = Color.fromRGBO(58, 89, 152, 1.0);
    grey = Color(0xFF2b2b2b);
  }
}
