import 'package:flutter/material.dart';
import 'package:meals/main.dart';

class MainDrawer extends StatelessWidget{
  const MainDrawer({super.key,required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(padding: EdgeInsets.all(20),
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.cyanAccent,Colors.cyanAccent.withOpacity(0.5)],
                begin: Alignment.topLeft,end: Alignment.bottomRight)),
            child: Row(children: [
              
              Icon(Icons.fastfood,size: 48,color: Colors.blue,),
              SizedBox(width: 18,),
              Text('Cooking Up !',style: Theme.of(context).textTheme.titleLarge!,)
            ],)),
        ListTile(
          leading: Icon(Icons.restaurant),
          title: Text('Meals'),
          onTap: (){
            onSelectScreen('meals');
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('Favorite'),
          onTap: (){
            onSelectScreen('favorite');
          },
        ),
        ListTile(
          leading: Icon(Icons.dashboard_customize),
          title: Text('Filter'),
          onTap: (){
            onSelectScreen('filters');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings_applications),
          title: Text('About Us'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: (){},
        ),
      ],),
    );
  }

}