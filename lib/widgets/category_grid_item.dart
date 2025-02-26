import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget{
  const CategoryGridItem({super.key,required this.category,required this.onselecCategory});

  final Category category;
  final void Function() onselecCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselecCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.45),
            category.color.withOpacity(0.9),
          ],
          begin: Alignment.topLeft, end: Alignment.bottomRight)
        ),
        child: Text(category.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),),
      ),
    );
  }

}