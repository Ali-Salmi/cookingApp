import 'package:flutter/material.dart';
import 'package:meal_app/models/Meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';

import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentPage=0;
  final List<Map<String,String>> _pages=[
    {
      'title': "Categories"
    },
    {
      'title': "Your favourite"
    }
  ];
  void selectPage(int value){
    setState(() {
      currentPage=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_pages[currentPage]['title']}"),
      ),
      body: Container(
          child: currentPage==0? CategorieScreen():FavouriteScreen(widget.favouriteMeals),
    ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: currentPage,
        unselectedItemColor: Colors.white,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourite",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
