import 'package:flutter/material.dart';
import 'package:flutter_my_app/models/profile.dart';

import 'Global.dart';

class ProfileChangeNotifier extends ChangeNotifier{
  Profile get profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();  //保存Profile变更
    super.notifyListeners();   //通知依赖的Widget更新
  }
}