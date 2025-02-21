import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget{
  const FiltersScreen({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilter = ref.watch(filtersProvider);
    return Scaffold(appBar: AppBar(
      title: Text('Your Filter'),
    ),
    /*drawer: MainDrawer(onSelectScreen: (identifier){
      if(identifier=='meals'){
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      }
    }),*/
    body:
       Column(children: [
        SwitchListTile(value: activeFilter[Filter.glutenFree]!,
          onChanged: (isChecked){
            ref.read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, isChecked);
          },
          title: Text('Gluten-free',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
          subtitle: Text('Only include gluten-free meals.',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white),),
        contentPadding: EdgeInsets.only(left: 34,right: 22),
        ),
        SwitchListTile(value: activeFilter[Filter.lactoseFree]!,
          onChanged: (isChecked){
            ref.read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree,isChecked);
          },
          title: Text('Lactose-free',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
          subtitle: Text('Only include lactose-free meals.',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white),),
          contentPadding: EdgeInsets.only(left: 34,right: 22),
        ),
        SwitchListTile(value: activeFilter[Filter.vegetarian]!,
          onChanged: (isChecked){
            ref.read(filtersProvider.notifier)
                .setFilter(Filter.vegetarian,isChecked);
          },
          title: Text('Vegetarian',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
          subtitle: Text('Only include vegetarian meals.',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white),),
          contentPadding: EdgeInsets.only(left: 34,right: 22),
        ),
        SwitchListTile(value: activeFilter[Filter.vegan]!,
          onChanged: (isChecked){
            ref.read(filtersProvider.notifier)
                .setFilter(Filter.vegan,isChecked);
          },
          title: Text('Vegan',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
          subtitle: Text('Only include vegan meals.',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white),),
          contentPadding: EdgeInsets.only(left: 34,right: 22),
        ),
      ],),
    );
  }
}