import 'package:flutter/material.dart';
import 'package:new_app/shared/app_theme.dart';
import 'package:new_app/categories/view/categories/widgets/category_item.dart';
import 'package:new_app/categories/data/models/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.onCategorySelected});
  final void Function(CategoryModel) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          id: "sports",
          color: AppTheme.red,
          imageName: "ball",
          name: AppLocalizations.of(context)!.sport),
      CategoryModel(
          id: "general",
          color: AppTheme.blue,
          imageName: "Politics",
          name: AppLocalizations.of(context)!.general),
      CategoryModel(
          id: "health",
          color: AppTheme.pink,
          imageName: "health",
          name: AppLocalizations.of(context)!.health),
      CategoryModel(
          id: "business",
          color: AppTheme.brown,
          imageName: "bussines",
          name: AppLocalizations.of(context)!.bussiness),
      CategoryModel(
          id: "entertainment",
          color: AppTheme.cly,
          imageName: "environment",
          name: AppLocalizations.of(context)!.entertain),
      CategoryModel(
          id: "science",
          color: AppTheme.yollow,
          imageName: "science",
          name: AppLocalizations.of(context)!.science)
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              AppLocalizations.of(context)!.pick,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppTheme.navy, fontSize: 28),
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                itemBuilder: (_, index) => GestureDetector(
                      onTap: () => onCategorySelected(categories[index]),
                      child: CategoryItem(
                        categoryModel: categories[index],
                        index: index,
                      ),
                    ),
                itemCount: categories.length),
          )
        ],
      ),
    );
  }
}
