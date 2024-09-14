import 'package:flutter/material.dart';
import 'package:new_app/app_theme.dart';
import 'package:new_app/home_screen.dart';
import 'package:new_app/news/news_details.dart';
import 'package:new_app/settings/settings_provider.dart';
import 'package:new_app/settings/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>SettingsProvider(),
    child: const NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider=Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsTab.routeName: (_) => const SettingsTab(),
        NewsDetails.routeName:(_)=>const NewsDetails()
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.language),
      
    );
  }
}
