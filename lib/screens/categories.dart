import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/store/FilterProvider.dart';
import 'package:meals_app/store/MealProvider.dart';

import 'package:meals_app/widgets/category_item.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterProvider);
    final meals = ref.watch(mealProvider);

    final filteredMeals = meals.where((meal) {
      if (filters[FilterEnum.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (filters[FilterEnum.isVegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    return SafeArea(
        child: GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryItem(
            category: category,
            meals: filteredMeals,
          )
      ],
    ));
  }
}
