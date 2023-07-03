import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/store/FavMealProvider.dart';
import 'package:meals_app/store/FilterProvider.dart';
import 'package:meals_app/widgets/drawer.dart';

class TabLayout extends ConsumerStatefulWidget {
  const TabLayout({super.key});

  @override
  ConsumerState<TabLayout> createState() => _TabLayoutState();
}

class _TabLayoutState extends ConsumerState<TabLayout> {
  int selectedScreenIndex = 0;

  void changeTab(index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  void setScreen(screen)  {
    Navigator.of(context).pop();
    if (screen == 'filters') {
       Navigator.push<Map<FilterEnum, bool>>(
          context, MaterialPageRoute(builder: (ctx) => FilterScreen()));
    }
  }

  var glutenFree = false;
  var isVegan = false;

  @override
  Widget build(BuildContext context) {
    Widget screen = const CategoryScreen();
    String appTitle = "Categories";

    if (selectedScreenIndex == 1) {
      final favMeals = ref.watch(favMealProvider);
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
