import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/store/FavMealProvider.dart';

class MealDetail extends ConsumerWidget {
  const MealDetail({super.key, required this.meal});

  final Meal meal;

  void showToast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favs = ref.watch(favMealProvider);

    bool isFav = favs.contains(meal);

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
              icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) => RotationTransition(
                        turns: Tween<double>(
                          begin: 0.8 ,
                          end:1
                        ).animate(animation),
                        child: child,
                      ),
                  child: Icon(isFav ? Icons.star : Icons.star_border,key: ValueKey(isFav),)))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
            tag: meal.id,
            child: Image.network(meal.imageUrl,
                fit: BoxFit.cover, height: 300, width: double.infinity),
          ),
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
