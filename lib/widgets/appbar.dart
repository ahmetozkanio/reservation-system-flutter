import 'package:flutter/material.dart';

AppBar globalAppBar(String title, List<Widget>? actions) {
  return AppBar(
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    actions: actions,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
