import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/screens/meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String img;
  CategoryItem({this.id, this.title, this.color, this.img});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image:
                DecorationImage(image: ExactAssetImage(img), fit: BoxFit.cover),
          ),
        ),
        InkWell(
          onTap: () {
            global_use_color = color;
            Navigator.of(context).pushNamed(MealScreen.route, arguments: {
              'id': id,
              'title': title,
              'color': color,
            });
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(15),
            child: Text(title),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.9),
                  color.withOpacity(0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
