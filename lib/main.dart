import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';

final theme= ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor:  const Color.fromARGB(255,131,57,0)
    ),

);
void main() {
  runApp(MaterialApp(
    theme:theme,
    home:const CategoryScreen()
  ));
}
