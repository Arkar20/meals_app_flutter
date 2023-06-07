import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key,required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals')
      ),
      body: meals.isNotEmpty ? ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx,index) => Text(
        meals[index].title
      )): const Center(
        child: Column(
          children: [
            Text("No Meal Found, Please Choose the category again!")
          ],
        ),
      ),
    );
  }
}