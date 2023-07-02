import 'package:flutter/material.dart';

class MealItemBadge extends StatelessWidget {
  const MealItemBadge({super.key,required this.icon,required this.label});

  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 20,),
        const SizedBox(width: 4,),
        Text(label)
      ],
    );
  }
}