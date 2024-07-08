import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  bool toggleMealFavStatus(Meal meal){
    final mealsFavorite = state.contains(meal);

    if(mealsFavorite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }else{
      state = [...state,meal];
      return true;
    }
  }
}
final favoriteMealsProvider =  StateNotifierProvider<FavoriteMealNotifier,List<Meal>>((ref) {
  return FavoriteMealNotifier();
});