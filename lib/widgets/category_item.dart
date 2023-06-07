import 'package:flutter/material.dart';
import "package:meals_app/models/category.dart";

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

   final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("click");
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(16) ,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors :[
               category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
            ]
            )
        ),
        child: Text(category.title,),
      ),
    );
  } 
}