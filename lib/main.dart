import 'package:flutter/material.dart';
import 'package:meal_app/models/Meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_detail.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters={
    'gluten':false,
    'lactos':false,
    'vegetarian':false,
    'vegan':false,
  };
  List<Meal> avaibleMeals=DUMMY_MEALS;
  List<Meal> _favouriteMeals=[];
  void _setFilters(Map<String,bool> _dataTofilt){
      setState(() {
        _filters=_dataTofilt;
        avaibleMeals=DUMMY_MEALS.where((meal) {
          if(_filters['gluten']==true && !meal.isGlutenFree){
            return false;
          }
          if(_filters['lactos']==true && !meal.isLactoseFree) return false;
          if(_filters['vegetarian']==true && !meal.isVegetarian) return false;
          if(_filters['vegan']==true && !meal.isVegan) return false;
          return true;
        }).toList();
      });
  }

  void toggleFavourite(String id){
    final existingIndex=_favouriteMeals.indexWhere((meal) => meal.id==id);
    setState(() {
      if(existingIndex>=0) {
        _favouriteMeals.removeAt(existingIndex);
      }
      else{
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
       }
    });
  }
  bool isFavourite(String id){
    return _favouriteMeals.any((meal) => meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 0, 0, 1)
            ),
          )
      ),
      routes: {
        '/': (context) => TabsScreen(_favouriteMeals),
        CtaegoryMealScreen.urlScreen: (context)=> CtaegoryMealScreen(avaibleMeals),
        MealDetails.urlScreen: (context)=> MealDetails(toggleFavourite,isFavourite),
        FilterScreen.urlScreen: (context)=> FilterScreen(_setFilters,_filters),
      },
      // home: const MyHomePage(),
      //home: CategorieScreen(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("meal App"),
      ),
      body: CategorieScreen(),
    );
  }
}
