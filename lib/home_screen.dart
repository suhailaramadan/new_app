import 'package:flutter/material.dart';
import 'package:new_app/app_theme.dart';
import 'package:new_app/category/categories_grid.dart';
import 'package:new_app/category/category_details.dart';
import 'package:new_app/category/category_model.dart';
import 'package:new_app/drawer/home.drawer.dart';
import 'package:new_app/settings/settings_tab.dart';

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
          title: const Text("News App"),
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
