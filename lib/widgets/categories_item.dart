import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';

class CategorieItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategorieItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CtaegoryMealScreen.urlScreen,arguments: {
          'id':id,
          'title':title,
        });
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color,
              color.withOpacity(0.6),
            ]
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
