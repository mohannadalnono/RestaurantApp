import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favoritesMeals;

  Favorites(this.favoritesMeals);
  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Container(
        child: Center(
          child: Text(
            "you hadn't choosen any favorites yet, stat adding sime!",
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (con, inde) {
          return MealItem(
            id: favoritesMeals[inde].id,
            title: favoritesMeals[inde].title,
            imageUrl: favoritesMeals[inde].imageUrl,
            duration: favoritesMeals[inde].duration,
            complexity: favoritesMeals[inde].complexity,
            affordability: favoritesMeals[inde].affordability,
            ScreenColor: Colors.amber,
          );
        },
        itemCount: favoritesMeals.length,
      );
    }
  }
}
