import 'package:flutter/material.dart';

import 'constants.dart';

Widget makePage({required int nums, required double stars}) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/$nums.jpg'),
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
                  "$nums",
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
                    fontSize: 22,
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
                  const Text(
                    "Some Place",
                    style: TextStyle(
                      height: 0.95,
                      fontSize: 50,
                      color: textColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Some City, Some Country",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: textColor.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  starRating(stars),
                  const SizedBox(height: 15),
                  Text(
                    "Some review type thing about some place and why you should visit it. Here are a few things you shoud keep in mind about this place. Also this place is the best place of this country",
                    style: TextStyle(
                      fontSize: 17,
                      color: textColor.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget starRating(double stars) {
  List<Widget> starList = [];

  for (int i = 0; i < stars.floor(); i++) {
    starList.add(
      const Padding(
        padding: EdgeInsets.only(right: 3.0),
        child: Icon(
          Icons.star_rounded,
          size: 18,
          color: Colors.amber,
        ),
      ),
    );
  }
  if ((stars - stars.floor()) >= 0.5) {
    starList.add(
      const Padding(
        padding: EdgeInsets.only(right: 3.0),
        child: Icon(
          Icons.star_half_rounded,
          size: 18,
          color: Colors.amber,
        ),
      ),
    );
    stars = stars.ceilToDouble();
  }
  for (int i = 0; i < 5 - stars.floor(); i++) {
    starList.add(
      const Padding(
        padding: EdgeInsets.only(right: 3.0),
        child: Icon(
          Icons.star_outline_rounded,
          size: 18,
          color: Colors.grey,
        ),
      ),
    );
  }
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: starList,
  );
}
