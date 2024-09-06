import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:new_app/app_theme.dart';

class SettingsTab extends StatelessWidget {
  static const routeName = "/setting";
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> languageList = ["English", "عربى"];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Language",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 23, color: AppTheme.primary),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropdown<String>(
            decoration: CustomDropdownDecoration(
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
            hintText: 'Select language',
            items: languageList,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
