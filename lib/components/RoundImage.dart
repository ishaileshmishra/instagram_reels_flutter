import 'package:flutter/material.dart';

Container circleImage(String networkImage, double size) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: const Color(0xff7c94b6),
      image: DecorationImage(
        image: NetworkImage(networkImage),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      gradient: LinearGradient(colors: [
        Colors.red,
        Colors.pink,
      ]),
      border: Border.all(
        color: Colors.red,
        width: 2.0,
      ),
    ),
  );
}

Container rectImage(String networkImage, double size) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: const Color(0xff7c94b6),
      image: DecorationImage(
        image: NetworkImage(networkImage),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      gradient: LinearGradient(colors: [
        Colors.red,
        Colors.pink,
      ]),
      border: Border.all(
        color: Colors.red,
        width: 2.0,
      ),
    ),
  );
}
