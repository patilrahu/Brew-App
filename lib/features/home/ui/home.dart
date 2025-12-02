import 'package:brewy_app/features/favourite/ui/favourite_brew.dart';
import 'package:brewy_app/features/home/ui/dashboard.dart';
import 'package:brewy_app/features/map/ui/map.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  final List<Widget> _screens = [
    Dashboard(),
    MapScreen(),
    FavouriteBrew(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        elevation: 10,
        showSelectedLabels: true,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        selectedLabelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        items: [
          _bottomNavBarItems('Home', Icons.home_rounded),
          _bottomNavBarItems('Map', Icons.map_rounded),
          _bottomNavBarItems('Favourites', Icons.favorite_rounded),
          _bottomNavBarItems('Profile', Icons.person_3_rounded),
        ],
      ),
    );
  }
}

BottomNavigationBarItem _bottomNavBarItems(String title, IconData icon) {
  return BottomNavigationBarItem(
    icon: Icon(icon, color: Colors.black),
    label: title,
    backgroundColor: Colors.white,
  );
}
