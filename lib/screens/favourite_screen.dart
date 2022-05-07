import 'package:flutter/material.dart';
import 'package:meal_app/models/Meal.dart';

import '../widgets/meal_item.dart';
class FavouriteScreen extends StatelessWidget {

  final List<Meal> favouriteMeals;

  const FavouriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(
        child: Text("You have no Favourite meals..!"),
      );
    }
      else{
        return ListView.builder(
          itemCount: favouriteMeals.length,
          itemBuilder: (ctx,index){
            return MealItem(
              id: favouriteMeals[index].id,
              imageUrl: favouriteMeals[index].imageUrl,
              title: favouriteMeals[index].title,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity,
              duration: favouriteMeals[index].duration,
            );
          },
        );
    }

  }
}
