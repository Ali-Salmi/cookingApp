import 'package:flutter/material.dart';
import 'package:meal_app/models/Meal.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';
class CtaegoryMealScreen extends StatefulWidget {
  static final urlScreen="/catMeal";
  final List<Meal> avaibleMeals;

  const CtaegoryMealScreen(this.avaibleMeals);
  @override
  _CtaegoryMealScreenState createState() => _CtaegoryMealScreenState();
}

class _CtaegoryMealScreenState extends State<CtaegoryMealScreen> {

  @override
  Widget build(BuildContext context){
    final data=ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final categpriId=data['id'];
    List<Meal> categoryMeals=widget.avaibleMeals.where((meal) {
          return meal.categories.contains(categpriId);
    }).toList();
  return Scaffold(
      appBar: AppBar(
        title: Text("${data['title']}"),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx,index){
          return MealItem(
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
          );
        },
      ),
    );
  }
}
