import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.meal,required this.toggleFavourite});

  final Meal meal;

    final void Function(Meal meal) toggleFavourite;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
           toggleFavourite(meal);
          }, icon: const Icon(Icons.star))
        ],
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Image.network(meal.imageUrl,
              fit: BoxFit.cover, height: 300, width: double.infinity),
          const SizedBox(
            height: 20,
          ),
          Text('Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.end,
                  ),
          const SizedBox(
            height: 16,
          ),
          for (final ingredient in meal.ingredients) Text(ingredient),
          const SizedBox(
            height: 24,
          ),
          Text('Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
          const SizedBox(
            height: 16,
          ),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
              child: Text(
                step,
                textAlign: TextAlign.left,
              ),
            ),
          const SizedBox(
            height: 24,
          ),
        ]),
      ),
    );
  }
}
