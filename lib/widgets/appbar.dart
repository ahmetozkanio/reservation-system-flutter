import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar globalAppBar(BuildContext context, String title, List<Widget>? actions) {
  return AppBar(
    iconTheme: const IconThemeData(
        // color: Theme.of(context).text,
        ),
    centerTitle: true,
    actions: actions,
    backgroundColor: Colors.transparent,
    // backgroundColor: Theme.of(context).secondaryHeaderColor,
    elevation: 0.0,
    title: Text(title, style: TextStyle(color: Colors.black)),
  );
}
