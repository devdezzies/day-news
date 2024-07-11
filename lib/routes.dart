import 'package:dayandnews/constants/app_palette.dart';
import 'package:dayandnews/view/explore_screen.dart';
import 'package:dayandnews/view/home_screen.dart';
import 'package:dayandnews/view/saved_screen.dart';
import 'package:flutter/material.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  int _currentIdx = 0;
  final List<Widget> _widgetOptions = const [
    HomeScreen(),
    ExploreScreen(),
    SavedScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIdx,
        children: _widgetOptions,
      ),
      backgroundColor: AppPalette.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppPalette.backgroundColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.door_back_door_outlined, size: 24, color: AppPalette.whiteFont), 
            label: '',
            activeIcon: Icon(Icons.door_back_door, color: AppPalette.primaryActive, size: 24,)
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined, size: 24, color: AppPalette.whiteFont,), 
            label: '',
            activeIcon: Icon(Icons.explore_rounded, size: 24, color: AppPalette.primaryActive,)),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border, size: 24, color: AppPalette.whiteFont), 
            label: '',
            activeIcon: Icon(Icons.bookmark, size: 24, color: AppPalette.primaryActive,))
        ],
        currentIndex: _currentIdx,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        enableFeedback: false,
        onTap: (idx) {
          setState(() {
            _currentIdx = idx;
          });
        },
      ),
    );
  }
}
