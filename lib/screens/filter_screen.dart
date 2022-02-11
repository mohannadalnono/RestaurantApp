import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/drawer_screen.dart';

import '../dummy_data.dart';

class FilterScreen extends StatefulWidget {
  static String route = '/filterScreen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters['gluten'];
    _isLactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  SwitchListTile buildSwitchTile(
      String title, String subtitle, bool val, Function updateVal) {
    return SwitchListTile(
      value: val,
      onChanged: updateVal,
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(241, 211, 2, 1),
        title: Text(
          "Filter",
          style: TextStyle(color: Color.fromRGBO(135, 29, 32, 1)),
        ),
      ),
      drawer: DrawerScreen(),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: Center(
              child: Text(
                "Set your filter NOW",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchTile(
                    "Gluten Free",
                    "Show only meals that does not contains Gluten.",
                    _isGlutenFree, (newval) {
                  setState(() {
                    _isGlutenFree = newval;
                  });
                }),
                buildSwitchTile(
                    "Lactose Free",
                    "Show only meals that does not contains Lactose.",
                    _isLactoseFree, (newval) {
                  setState(() {
                    _isLactoseFree = newval;
                  });
                }),
                buildSwitchTile(
                    "Vegan meals",
                    "Show only meals that suitable for Vegan peopls.",
                    _isVegan, (newval) {
                  setState(() {
                    _isVegan = newval;
                  });
                }),
                buildSwitchTile(
                    "Vegetarian meals",
                    "Show only meals that suitable for Vegetarians.",
                    _isVegetarian, (newval) {
                  setState(() {
                    _isVegetarian = newval;
                  });
                }),
                TextButton(
                  onPressed: () {
                    final Map<String, bool> selctedFilter = {
                      'gluten': _isGlutenFree,
                      'lactose': _isLactoseFree,
                      'vegan': _isVegan,
                      'vegetarian': _isVegetarian,
                    };
                    //TODO :: ADD TOAST NOTIFICATION
                    widget.saveFilters(selctedFilter);
                    
                    Fluttertoast.showToast(
                      msg: 'Filter applied!',
                      fontSize: 20,
                      textColor: Color.fromRGBO(135, 29, 32, 1),
                      backgroundColor: Color.fromRGBO(241, 211, 2, 0.5),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                    );
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(241, 211, 2, 1),
                        borderRadius: BorderRadius.circular(15)),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.save,
                          color: Color.fromRGBO(135, 29, 32, 1),
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Save",
                          style: TextStyle(
                              color: Color.fromRGBO(135, 29, 32, 1),
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
