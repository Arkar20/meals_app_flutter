import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/drawer.dart';

class TabLayout extends StatefulWidget {
  const TabLayout({super.key});

  @override
  State<TabLayout> createState() => _TabLayoutState();
}

final initialFilterValue = {
  FilterEnum.glutenFree: false,
  FilterEnum.isVegan: false
};

class _TabLayoutState extends State<TabLayout> {
  int selectedScreenIndex = 0;

  Map<FilterEnum, bool> filters = initialFilterValue;

  void changeTab(index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  final List<Meal> favMeals = [];

  void showToast(msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void toggleFavourite(Meal meal) {
    final exists = favMeals.contains(meal);
    if (exists) {
      setState(() {
        favMeals.remove(meal);
      });
      showToast("Unmark as Favourite");

      return;
    }

    setState(() {
      favMeals.add(meal);
    });
    showToast("Mark as Favourite");
  }

  void setScreen(screen) async {
    Navigator.of(context).pop();
    if (screen == 'filters') {
      final result = await Navigator.push<Map<FilterEnum, bool>>(
          context, MaterialPageRoute(builder: (ctx) => const FilterScreen()));

      setState(() {
        filters = result ?? initialFilterValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final filteredMeals= dummyMeals.where((meal) {

      if(filters[FilterEnum.glutenFree]!=meal.isGlutenFree){
        return false;
      }

      if(filters[FilterEnum.isVegan]!=meal.isVegan){
        return false;
      }
      return true;
    }).toList();

    Widget screen = CategoryScreen(
      meals: filteredMeals,
      toggleFavourite: toggleFavourite,
    );
    String appTitle = "Categories";

    if (selectedScreenIndex == 1) {
      screen = MealScreen(
        meals: favMeals,
        toggleFavourite: toggleFavourite,
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
