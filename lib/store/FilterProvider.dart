import 'package:flutter_riverpod/flutter_riverpod.dart';


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