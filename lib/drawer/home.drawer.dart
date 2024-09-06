import 'package:flutter/material.dart';
import 'package:new_app/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.onItemSelected});
  final void Function(DrawerItem) onItemSelected;
  @override
  Widget build(BuildContext context) {
    final titleLargeStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24);
    final screanSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screanSize.width * .7,
      child: Column(
        children: [
          Container(
            color: AppTheme.primary,
            height: screanSize.height * .2,
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              "News App",
              style: titleLargeStyle,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
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
                          "Categories",
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
                          "Settings",
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
