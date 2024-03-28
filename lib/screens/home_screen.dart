import 'package:dashkai/screens/HomeDesign.dart';
import 'package:dashkai/screens/favourites_screens.dart';
import 'package:dashkai/screens/my_trips_screen.dart';
import 'package:dashkai/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeDesign(),
    MyTripsScreen(),
    ProfileScreen(),
    const FavouritesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.grey.shade400,
            icon: const Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey.shade400,
            icon: const Icon(
              Icons.route,
            ),
            label: 'Routes',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey.shade400,
            icon: const Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey.shade400,
            icon: const Icon(
              Icons.favorite,
            ),
            label: 'Favourites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
