import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabLayout extends StatefulWidget {
  const TabLayout({super.key});

  @override
  State<TabLayout> createState() => _TabLayoutState();
}

class _TabLayoutState extends State<TabLayout> {

  int selectedScreenIndex=0;

  void changeTab(index){
    setState((){
      selectedScreenIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget screen= const CategoryScreen();
    String appTitle="Categories";

    if(selectedScreenIndex==1){
      screen= const  MealScreen(meals: []);
      appTitle="Your Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: screen ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          changeTab(index);
        },
        currentIndex: selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(icon:Icon(Icons.set_meal),label:"Category"),
          BottomNavigationBarItem(icon:Icon(Icons.star),label:"Favorites")
        ],
      )
    );
  }
}