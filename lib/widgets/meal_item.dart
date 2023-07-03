import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/widgets/MealItemBadge.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name;
  }

  void navigateToMealDetail(BuildContext context, Meal meal) {
    // final meal_detail = meal.

    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => MealDetail(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          navigateToMealDetail(context, meal);
        },
        child: Stack(
          children: [
            Hero(
              tag:meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(
                  kTransparentImage,
                ),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 44),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemBadge(
                              label: '${meal.duration} min',
                              icon: Icons.punch_clock,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemBadge(
                              label: complexityText,
                              icon: Icons.work,
                            ),
                            const SizedBox(width: 12),
                            MealItemBadge(
                              label: affordabilityText,
                              icon: Icons.attach_money,
                            ),
                          ],
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
