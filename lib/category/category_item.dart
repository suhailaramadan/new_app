import 'package:flutter/material.dart';
import 'package:new_app/category/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.index, required this.categoryModel});
  final CategoryModel categoryModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
            topStart: const Radius.circular(25),
            topEnd: const Radius.circular(25),
            bottomStart: Radius.circular(index.isEven ? 25 : 0),
            bottomEnd: Radius.circular(index.isOdd ? 25 : 0)),
        color: categoryModel.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/${categoryModel.imageName}.png",
            height: MediaQuery.of(context).size.height * .12,
          ),
          Text(
            categoryModel.name,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
