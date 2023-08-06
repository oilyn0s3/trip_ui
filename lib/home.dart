import 'package:flutter/material.dart';
import 'package:trip_ui/page_maker.dart';

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
        children: const [
          PageMaker(nums: 1, stars: 3.7),
          PageMaker(nums: 2, stars: 4.5),
          PageMaker(nums: 3, stars: 3),
          PageMaker(nums: 4, stars: 5),
        ],
      ),
    );
  }
}
