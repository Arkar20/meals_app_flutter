import 'package:flutter/material.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({super.key, required this.setScreen});

  final void Function(String screen) setScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Row(
            children: [
              Icon(Icons.fastfood,
                  size: 48, color: Theme.of(context).colorScheme.primary),
              const SizedBox(
                width: 12,
              ),
              const Text(
                'Cooking up',
              )
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.food_bank,
              size: 20, color: Theme.of(context).colorScheme.onBackground),
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16,
                ),
          ),
          onTap: () {
            setScreen('meals');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings,
              size: 20, color: Theme.of(context).colorScheme.onBackground),
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16,
                ),
          ),
          onTap: () {
            setScreen('filters');
          },
        ),
      ],
    ));
  }
}
