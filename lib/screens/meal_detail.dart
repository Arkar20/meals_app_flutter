import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/store/FavMealProvider.dart';

class MealDetail extends ConsumerWidget {
  const MealDetail(
      {super.key, required this.meal, required this.toggleFavourite});

  final Meal meal;

  final void Function(Meal meal) toggleFavourite;

  void showToast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final fav =
                    ref.read(favMealProvider.notifier).toggleFavourite(meal);

                showToast(context, fav ? "Favourited" : "Unfavourited");
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(meal.imageUrl,
              fit: BoxFit.cover, height: 300, width: double.infinity),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Ingredients',
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
