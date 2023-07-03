import 'package:flutter/material.dart';
enum FilterEnum {
   isVegan,
  glutenFree
}
class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
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
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
            ),
            SwitchListTile(
              value: isVegan,
              onChanged:handleChangeVegan,
              title: Text("Vegetarians",style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text('Only Include gluten free meals',style: Theme.of(context).textTheme.bodySmall),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
            ),
           
          ],
        ),
      ),
    );
  }
}
