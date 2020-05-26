import 'package:flutter/material.dart';

import 'Global.dart';
import 'ProfileChangeNotifier.dart';

class ThemeModel extends ProfileChangeNotifier{
  ColorSwatch get theme => Global.themes
      .firstWhere((e) => e.value == profile.theme,orElse: () => Colors.blue);

  setTheme(ColorSwatch color){
    if(color != theme){
      profile.theme = color[500].value;
      notifyListeners();
    }
  }
}