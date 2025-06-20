import 'package:flutter/cupertino.dart';
import 'package:health_sync/core/constant/local_keys.dart';
import 'package:health_sync/core/helpers/shared_prf_helpers/SharedPrefHelper.dart';

class LanguageProvider extends ChangeNotifier{
  String _currentLanguage = LocalKeys.englishLanguage;
  Future<void> changeLanguage(String newLanguage) async {
    if (newLanguage == _currentLanguage) return;
    _currentLanguage = newLanguage;
    SharedPrefHelper.setDate(LocalKeys.currentLanguage, _currentLanguage);
    notifyListeners();
  }

   String get currentLanguage => _currentLanguage;
   bool isEnglish() {
    return _currentLanguage == LocalKeys.englishLanguage;
  }

}