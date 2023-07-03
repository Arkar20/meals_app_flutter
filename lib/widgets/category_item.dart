import 'package:flutter/material.dart';
import "package:meals_app/models/category.dart";
import 'package:meals_app/models/meal.dart';

import 'package:meals_app/screens/meals.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.category,
      required this.toggleFavourite,
      required this.meals});

  final Category category;

  final void Function(Meal meal) toggleFavourite;
  final List<Meal> meals;

  void chooseMeal(BuildContext context, Category category) {
    final filterMeals = meals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealScreen(
                  title: category.title,
                  meals: filterMeals,
                  toggleFavourite: toggleFavourite,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {chooseMeal(context, category)},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  category.color.withOpacity(0.55),
                  category.color.withOpacity(0.9),
                ])),
        child: Text(category.title),
      ),
    );
  }
}
