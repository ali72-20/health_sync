
import 'package:flutter/cupertino.dart';
import 'package:health_sync/core/constant/local_keys.dart';
import 'package:health_sync/core/helpers/shared_prf_helpers/SharedPrefHelper.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class ThemeProvider extends ChangeNotifier{
  String _currentTheme = LocalKeys.lightTheme;

  Future<void> changeTheme(String newTheme) async{
    if(newTheme == _currentTheme) return;
    _currentTheme = newTheme;

    SharedPrefHelper.setDate(LocalKeys.currentTheme, _currentTheme);
    notifyListeners();
  }

  String get currentTheme => _currentTheme;

  bool isLightTheme(){
    return _currentTheme == LocalKeys.lightTheme;
  }
}