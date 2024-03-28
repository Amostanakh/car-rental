import 'package:dashkai/screens/HostScreens/host_profile_screen.dart';
import 'package:dashkai/screens/HostScreens/my_cars_screen.dart';
import 'package:dashkai/screens/HostScreens/trips.dart';
import 'package:flutter/material.dart';

class HostScreen extends StatefulWidget {
  const HostScreen({super.key});

  @override
  State<HostScreen> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<HostScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    MyTripsScreen(),
    HostcarsScreen(),
    const HostProfileScreen()
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
              Icons.car_crash,
            ),
            label: 'My Cars',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey.shade400,
            icon: const Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
