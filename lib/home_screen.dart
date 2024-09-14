import 'package:flutter/material.dart';
import 'package:new_app/app_theme.dart';
import 'package:new_app/category/categories_grid.dart';
import 'package:new_app/category/category_details.dart';
import 'package:new_app/category/category_model.dart';
import 'package:new_app/drawer/home.drawer.dart';
import 'package:new_app/settings/settings_tab.dart';
import 'package:new_app/tabs/search_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedDrawerItem == DrawerItem.settings
              ? AppLocalizations.of(context)!.settings
              : selectedCategory != null
                  ? selectedCategory!.name
                  : AppLocalizations.of(context)!.newsApp,style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25),),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchTab());
                },
                icon: const Icon(
                  Icons.search,
                  size: 32,
                ))
          ],
        ),
        drawer: HomeDrawer(onItemSelected: onDrawerItemSelected),
        body: selectedCategory != null
            ? CategoryDetails(selectedCategory!.id)
            : selectedDrawerItem == DrawerItem.categories
                ? CategoriesGrid(
                    onCategorySelected: onselectedCategory,
                  )
                : const SettingsTab(),
      ),
    );
  }

  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;
  void onDrawerItemSelected(DrawerItem drawerItem) {
    selectedDrawerItem = drawerItem;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onselectedCategory(CategoryModel categoryModel) {
    selectedCategory = categoryModel;
    setState(() {});
  }
}
