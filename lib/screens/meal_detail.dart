import 'package:flutter/material.dart';
import '../dummy_data.dart';
class MealDetails extends StatelessWidget {
  final Function toggleFavourite;
  final Function isFavourite;
  static final urlScreen = "/MealDetail";

  const MealDetails(this.toggleFavourite,this.isFavourite);

  Widget buildContainer(context, text) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme
            .of(context)
            .textTheme
            .titleMedium,
      ),
    );
  }

  Widget buildContainerW(child) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        height: 200,
        width: 250,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute
        .of(context)
        ?.settings
        .arguments as String;
    final mealDetail = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(mealDetail.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    mealDetail.imageUrl,
                    fit: BoxFit.cover,
                  )),
              buildContainer(context, "Ingrediants"),
              buildContainerW(
                ListView.builder(
                  itemBuilder: (ctx, index) =>
                      Card(
                        color: Theme
                            .of(context)
                            .accentColor,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(mealDetail.ingredients[index]),
                        ),
                      ),
                  itemCount: mealDetail.ingredients.length,
                ),
              ),
              buildContainer(context, "Steps"),
              buildContainerW(
                ListView.builder(
                  itemBuilder: (ctx, index) =>
                      Column(
                        children: [
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                child: Text("N°: ${index + 1}"),
                                backgroundColor: Theme
                                    .of(context)
                                    .accentColor,
                                foregroundColor: Colors.black,
                              ),
                            ),
                            title: Text(mealDetail.steps[index],
                              style: TextStyle(fontSize: 16),),
                          ),
                          Divider(color: Colors.grey,),
                        ],
                      ),
                  itemCount: mealDetail.steps.length,
                ),
              ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: isFavourite(mealId)==true?Icon(Icons.star):Icon(Icons.star_border),
        onPressed: (){
          toggleFavourite(mealId);
          if(isFavourite(mealId)==true){
            final sbar = SnackBar(
              content: Text("${mealDetail.title} is Favourite Now"),
              duration: Duration(seconds: 5),
            );
            ScaffoldMessenger.of(context).showSnackBar(sbar);
          }
          else{
            final sbar = SnackBar(
              content: Text(" Your removed ${mealDetail.title} from Favourite meals"),
              duration: Duration(seconds: 5),
            );
            ScaffoldMessenger.of(context).showSnackBar(sbar);
          }
        },
      ),
    );
  }
}
