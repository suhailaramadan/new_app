import 'package:flutter/material.dart';
import 'package:new_app/app_theme.dart';
import 'package:new_app/category/category_item.dart';
import 'package:new_app/category/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
  const List <CategoryModel> categories=[
      CategoryModel(color:AppTheme.red, imageName:"ball", name:"Sport"),
      CategoryModel(color: AppTheme.blue, imageName:"Politics", name:"Politics"),
      CategoryModel(color: AppTheme.pink, imageName:"health", name:"Health"),
      CategoryModel(color: AppTheme.brown, imageName:"bussines", name:"Bussines"),
      CategoryModel(color: AppTheme.cly, imageName:"environment", name:"Environment"),
      CategoryModel(color: AppTheme.yollow, imageName:"science", name:"Science")
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              "Pick your category of interest",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppTheme.navy),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15),
              itemBuilder:(_,index)=> CategoryItem(
                categoryModel: categories[index],
                index:index,),
              itemCount:categories.length),
          )
        ],
      ),
    );
  }
}
