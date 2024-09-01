import 'package:flutter/material.dart';
import 'package:new_app/app_theme.dart';
import 'package:new_app/home_screen.dart';
import 'package:new_app/settings/settings_tab.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>const HomeScreen(),
        SettingsTab.routeName:(_) => const SettingsTab()
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  
  }
}
