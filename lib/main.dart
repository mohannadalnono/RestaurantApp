import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import './screens/categories_screen.dart';
import './screens/meal_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

Color global_use_color;

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _setfilters(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
        ;
      }).toList();
    });
  }

  void _toggleFavorite(String mealID) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool _isMealFavorite(String mealID) {
    return _favoriteMeals.any((meal) => meal.id == mealID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        canvasColor: const Color.fromRGBO(255, 240, 240, 1),
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        canvasColor: Colors.black,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
        ),
      ),
      //home: CategoriesScreen(),
      routes: {
        '/': (context) => TabScreen(_favoriteMeals),
//        CategoriesScreen.route: (context) => CategoriesScreen(), NOT USED.
        FilterScreen.route: (context) => FilterScreen(_filters, _setfilters),
        MealScreen.route: (context) => MealScreen(_availableMeals),
        MealDetails.route: (context) =>
            MealDetails(_toggleFavorite, _isMealFavorite),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}
