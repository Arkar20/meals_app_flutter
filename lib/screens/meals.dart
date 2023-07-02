import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key,  this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isNotEmpty
        ? ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) => MealItem(meal: meals[index]),
          )
        : const Center(
            child: Column(
              children: [
                Text("No Meal Found, Please Choose the category again!")
              ],
            ),
          );
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
