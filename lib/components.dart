import 'package:flutter/material.dart';

// Widget makePage({required int nums, required double stars}) {
//   return PageMaker();
// }

Widget starRating(double stars) {
  List<Widget> starList = [];
  int starsInt;

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
  }
  starsInt = stars.ceil();
  for (int i = 0; i < 5 - starsInt; i++) {
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
  starList.add(
    Padding(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: Text(
        "$stars",
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    ),
  );
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: starList,
  );
}
