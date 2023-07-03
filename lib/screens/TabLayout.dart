import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/store/FavMealProvider.dart';
import 'package:meals_app/store/MealProvider.dart';
import 'package:meals_app/widgets/drawer.dart';

enum FilterEnum { isVegan, glutenFree }

class TabLayout extends ConsumerStatefulWidget {
  const TabLayout({super.key});

  @override
  ConsumerState<TabLayout> createState() => _TabLayoutState();
}

final initialFilterValue = {
  FilterEnum.glutenFree: false,
  FilterEnum.isVegan: false
};

class _TabLayoutState extends ConsumerState<TabLayout> {
  int selectedScreenIndex = 0;

  Map<FilterEnum, bool> filters = initialFilterValue;

  void changeTab(index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  final List<Meal> favMeals = [];



  

  void setScreen(screen) async {
    Navigator.of(context).pop();
    if (screen == 'filters') {
      final result = await Navigator.push<Map<FilterEnum, bool>>(
          context,
          MaterialPageRoute(
              builder: (ctx) => FilterScreen(
                    filters: filters,
                  )));

      setState(() {
        filters = result ?? initialFilterValue;
      });
    }
  }

  var glutenFree = false;
  var isVegan = false;

  @override
  Widget build(BuildContext context) {
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

    Widget screen = CategoryScreen(
      meals: filteredMeals,
    );
    String appTitle = "Categories";

    if (selectedScreenIndex == 1) {
      final favMeals= ref.watch(favMealProvider);
      screen = MealScreen(
        meals: favMeals,
      );
      appTitle = "Your Favourites";
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        drawer: BaseDrawer(setScreen: setScreen),
        body: screen,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            changeTab(index);
          },
          currentIndex: selectedScreenIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
          ],
        ));
  }
}
