import 'package:flutter/material.dart';
import 'package:merc/homeviews/chat.dart';
import 'package:merc/homeviews/home.dart';
import 'package:merc/homeviews/leaderboard.dart';
import 'package:merc/homeviews/profile.dart';
import 'package:merc/homeviews/trace.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    LeaderboardScreen(),
    TrackScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png', height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/leader.png', height: 24),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/trace.png', height: 24),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/chat.png', height: 24),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/profile.png', height: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
