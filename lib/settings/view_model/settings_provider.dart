import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingsProvider extends ChangeNotifier {
  String Language = "ar";
  void changeLang(String selectedLanguage) {
    Language = selectedLanguage;
    notifyListeners();
  }
  Future setLangToCash(String lang)async{
    final prefs=await SharedPreferences.getInstance();
    prefs.setString("lang",lang);

  }
  Future loadLang()async{
    final prefs=await SharedPreferences.getInstance();
    String language= prefs.getString("lang")??"ar";
    Language=language;
    notifyListeners();

  }
}
