import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  void _onScroll() {
    print("Scroll");
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 1)..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Container(color: Colors.cyan),
          Container(color: Colors.pink),
          Container(color: Colors.amber),
        ],
      ),
    );
  }
}
