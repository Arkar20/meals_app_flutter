import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavMealNotifier extends StateNotifier<List<Meal>> {
  FavMealNotifier() : super([]);

  bool toggleFavourite(Meal meal) {
    final exists = state.contains(meal);
    if (exists) {
      state= state.where((meal)=>meal.id!=meal.id).toList();
      return false;
    }
    state= [...state,meal];
    return true;
  }
}

final favMealProvider = StateNotifierProvider<FavMealNotifier,List<Meal>>((ref)=>FavMealNotifier());
