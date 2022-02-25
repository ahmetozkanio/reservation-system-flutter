import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

formTitle(String title) {
  final style = TextStyle(fontSize: 24, fontWeight: FontWeight.normal);
  return Text(
    title,
    style: GoogleFonts.roboto(textStyle: style),
  );
}
