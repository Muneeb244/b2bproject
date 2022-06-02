import 'package:flutter/material.dart';

BottomNavigationBar navigation() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.blue,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home, color: Colors.white),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        label: 'Search',
        // backgroundColor: Colors.green,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        label: 'Notifications',
        // backgroundColor: Colors.purple,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: Colors.white,
        ),
        label: 'Settings',
        // backgroundColor: Colors.pink,
      ),
    ],
    // currentIndex: _selectedIndex,
    // selectedItemColor: Colors.amber[800],
    // onTap: _onItemTapped,
  );
}
