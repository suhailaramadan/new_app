import 'package:flutter/material.dart';
import 'package:new_app/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.onItemSelected});
  final void Function(DrawerItem) onItemSelected;
  @override
  Widget build(BuildContext context) {
    final titleLargeStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25);
    final screanSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screanSize.width * .7,
      child: Column(
        children: [
          Container(
            color: AppTheme.primary,
            height: screanSize.height * .18,
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context)!.newsApp,
              style: titleLargeStyle,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              color: AppTheme.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.categories),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          AppLocalizations.of(context)!.category,
                          style:
                              titleLargeStyle?.copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.settings),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          AppLocalizations.of(context)!.settings,
                          style:
                              titleLargeStyle?.copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings;
}
