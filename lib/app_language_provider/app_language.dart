import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('ru');

  Locale get appLocal => _appLocale ?? Locale("ru");
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('ru');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return Null;
  }


  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("ru")) {
      _appLocale = Locale("ru");
      await prefs.setString('language_code', 'ru');
      await prefs.setString('countryCode', 'RU');
    }
    else if(type == Locale("uz")){
      _appLocale = Locale("uz");
      await prefs.setString('language_code', 'uz');
      await prefs.setString('countryCode', 'UZ');
    }

    else {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}