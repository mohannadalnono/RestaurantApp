import 'package:flutter/material.dart';
import 'package:meal_app/screens/filter_screen.dart';
import './categories_screen.dart';

Widget BuildListTile(String title, IconData icon, Function fun) {
  return ListTile(
    leading: Icon(
      icon,
      size: 32,
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 20),
    ),
    onTap: fun,
  );
}

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Color.fromRGBO(241, 211, 2, 1),
            child: Center(
              child: Text(
                "Meal App",
                style: TextStyle(
                  color: Color.fromRGBO(135, 29, 32, 1),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          BuildListTile("Meals", Icons.food_bank, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          BuildListTile(
            "Filter",
            Icons.search,
            () {
              Navigator.of(context).pushNamed(FilterScreen.route);
            },
          ),
        ],
      ),
    );
  }
}
