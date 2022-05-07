import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';
class FilterScreen extends StatefulWidget {
  static final urlScreen="/filterMeal";
  final Function saveFilters;
  final Map<String,bool> _filters;

  const FilterScreen(this.saveFilters,this._filters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {


  Map<String,bool> _filters={
    'gluten':false,
    'lactos':false,
    'vegetarian':false,
    'vegan':false,
  };
  @override
  initState(){
    setState(() {
      _filters=widget._filters;
    });
    super.initState();
  }


  Widget buildSwitchListTile(title,description,currenValue,updateValue){
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currenValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          ElevatedButton(
            onPressed: (){
             widget.saveFilters(_filters);
            },
            child: Icon(Icons.save),
          ),
          SizedBox(width: 15,),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Select Your filters",style: Theme.of(context).textTheme.titleMedium,),
          ),
          buildSwitchListTile("Gluten-Free","Only includes Glutten-Free meals",_filters['gluten'],(value){
            setState(() {
              _filters['gluten']=value;
            });
          }),
          buildSwitchListTile("Lactos-Free","Only includes Lactos-Free meals",_filters['lactos'],(value){
            setState(() {
              _filters['lactos']=value;
            });
          }),
          buildSwitchListTile("Vegetarian","Only includes Vegetarian meals",_filters['vegetarian'],(value){
            setState(() {
              _filters['vegetarian']=value;
            });
          }),
          buildSwitchListTile("Vegan","Only includes Vegan meals",_filters['vegan'],(value){
            setState(() {
              _filters['vegan']=value;
            });
          }),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

