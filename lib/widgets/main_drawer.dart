import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildTile(title,icon,tapHandel){
    return ListTile(
      onTap: tapHandel,
      leading: Icon(icon,size: 26,),
      title: Text(title,style: TextStyle(fontSize: 24,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up",
              style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 20,),
          buildTile("Meal",Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildTile("Setting",Icons.settings,(){Navigator.of(context).pushReplacementNamed(FilterScreen.urlScreen);}),
        ],
      ),
    );
  }
}
