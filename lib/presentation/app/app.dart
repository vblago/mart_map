import 'package:mart_map/presentation/app/theme.dart';
import 'package:mart_map/presentation/utils/localizations.dart';
import 'package:mart_map/presentation/views/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale("en")],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).appName,
      theme: ThemeApp().data,
      home: new MainScreen(),
    );
  }
}
