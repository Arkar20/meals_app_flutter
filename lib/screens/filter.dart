import 'package:flutter/material.dart';
import 'package:meals_app/screens/TabLayout.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key,required this.filters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();

  final Map<FilterEnum,bool> filters;
}

class _FilterScreenState extends State<FilterScreen> {

  var glutenFree = false;
  var isVegan = false;

  void handleChangeGluten(isChecked) {
    setState(() {
      glutenFree = isChecked;
    });
  }

  void handleChangeVegan(isChecked) {
    setState(() {
      isVegan = isChecked;
    });
  }


  @override
  void initState() {
    super.initState();
    glutenFree=widget.filters[FilterEnum.glutenFree]!;
    isVegan=widget.filters[FilterEnum.isVegan]!;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fliter Setting"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            FilterEnum.glutenFree:glutenFree,
            FilterEnum.isVegan:isVegan
          });

          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFree,
              onChanged:handleChangeGluten,
              title: Text("Gluten free",style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text('Only Include gluten free meals',style: Theme.of(context).textTheme.bodySmall),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:const EdgeInsets.symmetric(horizontal: 24),
            ),
            SwitchListTile(
              value: isVegan,
              onChanged:handleChangeVegan,
              title: Text("Vegetarians",style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text('Only Include gluten free meals',style: Theme.of(context).textTheme.bodySmall),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            ),
           
          ],
        ),
      ),
    );
  }
}
