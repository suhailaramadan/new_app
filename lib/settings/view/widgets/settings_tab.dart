import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:new_app/shared/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_app/settings/view_model/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  static const routeName = "/setting";
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final int x = 0;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    final List<String> languageList = [
      AppLocalizations.of(context)!.english,
      AppLocalizations.of(context)!.arabic
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              AppLocalizations.of(context)!.lang,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primary),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropdown<String>(
            decoration: CustomDropdownDecoration(
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppTheme.grey),
              closedBorder: const Border.symmetric(
                  horizontal: BorderSide(width: 2, color: AppTheme.primary),
                  vertical: BorderSide(width: 2, color: AppTheme.primary)),
              headerStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppTheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              closedFillColor: Colors.transparent,
              listItemStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppTheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            hintText: AppLocalizations.of(context)!.selectLang,
            items: languageList,
            onChanged: (value){
              if(value == null)return;
              setState(() {
                settingsProvider.changeLang(value == AppLocalizations.of(context)!.arabic ? 'ar' : 'en');
              });

            }
            
          )
        ],
      ),
    );
  }
}
