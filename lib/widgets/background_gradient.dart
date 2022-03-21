import 'package:flutter/material.dart';

BoxDecoration pageBackgroundGradient(BuildContext context) {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Theme.of(context).secondaryHeaderColor,
        Color.fromARGB(255, 255, 255, 255),
      ]));
}

BoxDecoration cardBackgroundGradient(Color color, Color? color1) {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        color,
        Color.fromARGB(255, 255, 255, 255),
      ]));
}
