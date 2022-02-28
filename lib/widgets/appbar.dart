import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar globalAppBar(String title, List<Widget>? actions) {
  return AppBar(
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    centerTitle: true,
    actions: actions,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(
      title,
      style: GoogleFonts.roboto(
        color: Colors.black,
      ),
    ),
  );
}
