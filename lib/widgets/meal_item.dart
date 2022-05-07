import 'package:flutter/material.dart';

import '../models/Meal.dart';
import '../screens/meal_detail.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability});

  void selectItem(ctx) {
    Navigator.of(ctx).pushNamed(MealDetails.urlScreen, arguments: id);
  }

  String get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectItem(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 8,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 5,
                    right: 10,
                    child: Container(
                      width: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 17, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    )),
              ],
            ),
            Container(
              height: 50,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text("${duration} min"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text(getComplexity),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.monetization_on_outlined),
                        SizedBox(
                          width: 6,
                        ),
                        Text(getAffordability),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
