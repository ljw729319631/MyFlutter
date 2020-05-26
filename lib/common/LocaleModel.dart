import 'package:flutter/material.dart';

import 'ProfileChangeNotifier.dart';

class LocaleModel extends ProfileChangeNotifier{

  Locale getLocale(){
    if(profile.locale == null) return null;
    var t = profile.locale.split("_");
    return Locale(t[0],t[1]);
  }

  //获取当前Locale的字符串表示
  String get locale => profile.locale;

  //当用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String locale){
    if(locale != profile.locale){
      profile.locale = locale;
      notifyListeners();
    }
  }

}