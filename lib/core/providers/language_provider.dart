import 'package:flutter/cupertino.dart';
import 'package:health_sync/core/constant/local_keys.dart';

class LanguageProvider extends ChangeNotifier{
  String _currentLanguage = LocalKeys.arabicLanguage;


  Future<void> changeLanguage(String newLanguage) async {
    if (newLanguage == _currentLanguage) return;
    _currentLanguage = newLanguage;
    notifyListeners();
  }

  String get currentLanguage => _currentLanguage;
  bool isEnglish() {
    return _currentLanguage == LocalKeys.englishLanguage;
  }
}