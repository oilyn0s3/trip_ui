import 'package:flutter/material.dart';

import 'components.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  void _onScroll() {
    // print("Scroll");
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          makePage(nums: 1, stars: 3.7),
          makePage(nums: 2, stars: 4.5),
          makePage(nums: 3, stars: 3),
          makePage(nums: 4, stars: 5),
        ],
      ),
    );
  }
}
