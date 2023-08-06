import 'package:flutter/material.dart';
import 'package:trip_ui/fade_ani.dart';

import 'components.dart';
import 'constants.dart';

class PageMaker extends StatefulWidget {
  final int nums;
  final double stars;
  const PageMaker({
    super.key,
    required this.nums,
    required this.stars,
  });

  @override
  State<PageMaker> createState() => _PageMakerState();
}

class _PageMakerState extends State<PageMaker> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 9000), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/${widget.nums}.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.1, 0.6, 01],
            colors: [
              Colors.black.withOpacity(1),
              Colors.black.withOpacity(.6),
              Colors.black.withOpacity(0.1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${widget.nums}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 70,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "/4",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 70,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // FadeAnimation(
                    //   controller: _controller,
                    //   givenChild: const Text(
                    //     "Some Place",
                    //     style: TextStyle(
                    //       height: 0.95,
                    //       fontSize: 50,
                    //       color: textColor,
                    //       fontWeight: FontWeight.w800,
                    //     ),
                    //   ),
                    // ),
                    FadeAni(
                      delay: 0.5,
                      child: const Text(
                        "Some Place",
                        style: TextStyle(
                          height: 0.95,
                          fontSize: 50,
                          color: textColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),
                    FadeAni(
                      delay: 0.6,
                      child: Text(
                        "Some City, Some Country",
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: textColor.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeAni(
                      delay: 0.7,
                      child: starRating(widget.stars),
                    ),
                    const SizedBox(height: 20),
                    FadeAni(
                      delay: 0.8,
                      child: Text(
                        "Some review type thing about some place and why you should visit it. Here are a few things you shoud keep in mind about this place. Also this place is the best place of this country",
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
