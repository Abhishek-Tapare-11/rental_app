import 'package:flutter/material.dart';
import 'package:rental_app/view/home.dart';
import 'package:rental_app/view/orders.dart';
import 'package:rental_app/view/profile.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _pages = 
  [
    Home(), 
    Orders(), 
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_4_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
