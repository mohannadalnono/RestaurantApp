import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  static String route = '/mealDetalis';
  final Function toggleFavorites;
  final Function isFavorites;
  const MealDetails(this.toggleFavorites, this.isFavorites);

  @override
  Widget build(BuildContext context) {
    final MealID_and_mealColor =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final Mealid = MealID_and_mealColor['id'];
    final Color MealColor = MealID_and_mealColor['color'];

    Meal selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == Mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        backgroundColor: MealColor,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorites(Mealid) ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () => toggleFavorites(Mealid),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(selectedMeal.imageUrl),
            namedTextContainer("Ingredients"),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              width: double.infinity,
              height: 130,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(30),
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  elevation: 6,
                  margin: EdgeInsets.all(5),
                  color: MealColor,
                  //TODO Context color!
                  child: Text(selectedMeal.ingredients[index]),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            namedTextContainer("Steps"),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              width: double.infinity,
              height: 130,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(30),
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(index.toString()),
                        backgroundColor: MealColor,
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(color: Colors.black38)
                  ],
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container namedTextContainer(String s) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      s,
      style: TextStyle(fontSize: 18),
    ),
  );
}
