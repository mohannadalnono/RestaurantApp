import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import './categories_screen.dart';
import './favorates.dart';

import 'drawer_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var _selectedPageIndex = 0;
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'title': 'Categories',
        'page': CategoriesScreen(),
      },
      {
        'title': 'Favorites',
        'page': Favorites(widget.favoriteMeals),
      }
    ];
    super.initState();
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(color: Color.fromRGBO(135, 29, 32, 1)),
        ),
        backgroundColor: Color.fromRGBO(241, 211, 2, 1),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromRGBO(135, 29, 32, 1)),
      ),
      drawer: DrawerScreen(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Color.fromRGBO(241, 211, 2, 1),
        selectedItemColor: Color.fromRGBO(135, 29, 32, 1),
        unselectedItemColor: Color.fromRGBO(22, 25, 37, .3),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), title: Text("Categories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("Favorites")),
        ],
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
