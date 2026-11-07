import 'package:flutter/material.dart';

import 'home_page.dart';
import 'profile_page.dart';
import 'sample_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  final List<Widget> _page = [
    const SamplePage(),
    const HomePage(),
    const ProfilePage(),
  ];

  final List<String> _titles = ['Sample', 'Home', 'Profile'];

  final List<IconData> _icons = [Icons.article, Icons.home, Icons.person];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NavigationBar(
              selectedIndex: _currentIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              height: 65,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.article),
                  selectedIcon: Icon(Icons.article_outlined),
                  label: 'Sample',
                ),
                NavigationDestination(
                  icon: Icon(Icons.home),
                  selectedIcon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person),
                  selectedIcon: Icon(Icons.person_outlined),
                  label: 'Profile',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Icon(_icons[_currentIndex], size: 28),
                  const SizedBox(width: 8),
                  Text(
                    _titles[_currentIndex],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: _page[_currentIndex],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
