import 'package:flutter/material.dart';
import 'package:social/Pages/ProfilePage.dart';
import 'package:social/flutter_snake_navigationbar.dart';

import 'Pages/AddPost/PickImage.dart';
import 'Pages/Chatiing/Screens/ChatPage.dart';
import 'Pages/Feed/Screen/FeedScreen.dart';
import 'Pages/SearchPage.dart';

class SnakeNavigationBarExampleScreen extends StatefulWidget {
  @override
  _SnakeNavigationBarExampleScreenState createState() =>
      _SnakeNavigationBarExampleScreenState();
}

class _SnakeNavigationBarExampleScreenState
    extends State<SnakeNavigationBarExampleScreen> {
  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);

  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.teal;

  Color? containerColor;

  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  List<Widget> _pages = [FeedScreen(), Search(), Addpost(), Chat(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: PageView(
        physics: new NeverScrollableScrollPhysics(),
        controller: pageController,
        children: _pages,
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        // height: 80,
        elevation: 5,
        shadowColor: Colors.teal,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.blueGrey,

        ///configuration for SnakeNavigationBar.gradient
        // snakeViewGradient: selectedGradient,
        // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        // unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedItemPosition,
        onTap: (index) {
          setState(() => _selectedItemPosition = index);

          pageController.animateToPage(index,
              duration: Duration(milliseconds: 10), curve: Curves.ease);
        },

        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'tickets'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'calendar'),
          const BottomNavigationBarItem(icon: Icon(Icons.add), label: 'home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline), label: 'microphone'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'search')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
