import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorite_provider.dart';

class MealDetailsScreen extends ConsumerWidget{
  const MealDetailsScreen({super.key,required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),
      actions: [IconButton(onPressed: (){
        final wasAdded =
        ref.read(favoriteMealsProvider.notifier).toggleMealFavStatus(meal);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(wasAdded? '${meal.title} is added as a favorite' : '${meal.title} is no longer as a favorite')));
        },
          icon: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (child,animation){
            return RotationTransition(turns: Tween(begin: 0.8,end: 1.0).animate(animation),child: child,);
            },
              child: Icon(isFavorite ? Icons.star : Icons.star_border,color: Colors.redAccent,key: ValueKey(isFavorite),)
          ))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(tag: meal.id,
                child: Image.network(meal.imageUrl,width: double.infinity,height: 300,fit: BoxFit.cover,)),
            SizedBox(height: 14),
            Text(meal.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 14),
            for (final ingredient in meal.ingredients)
              Text(ingredient,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
              ),),
            SizedBox(height: 25),
            Text('Steps',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 14),
            for (final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                child: Text(steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),),
              ),
          ],
        ),
      ),
    );
  }

}