import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  String language="en";
  void changeLang(String selectedLanguage){
    if(language!=selectedLanguage)return;
    language=selectedLanguage;
    notifyListeners();
  }

}