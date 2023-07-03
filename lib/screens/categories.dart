import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

import 'package:meals_app/widgets/category_item.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key,required this.toggleFavourite,required this.meals});

  final void Function(Meal meal) toggleFavourite;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
        GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:3 / 2,
          crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
          children: [
            for(final category in availableCategories)  
              CategoryItem(category: category,toggleFavourite: toggleFavourite,meals: meals,)
          ],
          ));
    
  }
}