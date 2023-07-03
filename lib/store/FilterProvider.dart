import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/store/MealProvider.dart';


enum FilterEnum { isVegan, glutenFree }

class FilterProvider extends StateNotifier<Map<FilterEnum,bool>>{
    FilterProvider(): super({
      FilterEnum.glutenFree:false,
      FilterEnum.isVegan:false
    });

  void setFilterState(FilterEnum filterEnum, bool value){
   
    state={
      ...state,
      filterEnum:value
    };
  }

}

final filterProvider=StateNotifierProvider<FilterProvider,Map<FilterEnum,bool>>((ref)=>FilterProvider());

final filterMealProviders= Provider((ref){
    final filters = ref.watch(filterProvider);
    final meals = ref.watch(mealProvider);

    return meals.where((meal) {
      if (filters[FilterEnum.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (filters[FilterEnum.isVegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});