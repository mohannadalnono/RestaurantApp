import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class MealScreen extends StatefulWidget {
  static String route = '/meals';
  final List<Meal> availableMeals;

  MealScreen(this.availableMeals);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  // String get getComplexity{
  @override
  Widget build(BuildContext context) {
    final routArguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final Color screenColor = routArguments['color'];
    final screenTitle = routArguments['title'];
    final screenID = routArguments['id'];
    final mealsElements = widget.availableMeals.where((meal) {
      return meal.categories.contains(screenID);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: routArguments['color'],
        //          TEST
        backgroundColor: global_use_color,
        //           easier !
        title: Text(screenTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (con, inde) {
          return MealItem(
            id: mealsElements[inde].id,
            title: mealsElements[inde].title,
            imageUrl: mealsElements[inde].imageUrl,
            duration: mealsElements[inde].duration,
            complexity: mealsElements[inde].complexity,
            affordability: mealsElements[inde].affordability,
            ScreenColor: screenColor,
          );
        },
        itemCount: mealsElements.length,
      ),
    );
  }
}
