import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/store/FilterProvider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fliter Setting"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: filter[FilterEnum.glutenFree]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilterState(FilterEnum.glutenFree, value);
            },
            title: Text("Gluten free",
                style: Theme.of(context).textTheme.titleMedium),
            subtitle: Text('Only Include gluten free meals',
                style: Theme.of(context).textTheme.bodySmall),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          ),
          SwitchListTile(
            value: filter[FilterEnum.isVegan]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilterState(FilterEnum.isVegan, value);
            },
            title: Text("Vegetarians",
                style: Theme.of(context).textTheme.titleMedium),
            subtitle: Text('Only Include gluten free meals',
                style: Theme.of(context).textTheme.bodySmall),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          ),
        ],
      ),
    );
  }
}
