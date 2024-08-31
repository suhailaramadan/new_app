import 'package:flutter/material.dart';
import 'package:new_app/app_theme.dart';
import 'package:new_app/category/categories_grid.dart';
import 'package:new_app/drawer/home.drawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title:const Text("News App"),
        ),
        drawer:const HomeDrawer(),
        body:const CategoriesGrid(),
      ),
    );
  }

}
