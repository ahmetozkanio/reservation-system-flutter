import 'package:flutter/material.dart';

Container searchTextField(
    context, Function(String) searchOnChange, String hintText) {
  return Container(
    padding: EdgeInsets.only(left: 16, right: 24),
    height: 32.0,
    child: TextField(
      onChanged: (value) {
        searchOnChange(value);
      },
      decoration: InputDecoration(
          filled: true,
          //fillColor: Color.fromARGB(255, 255, 255, 255),

          contentPadding: EdgeInsets.all(3),
          prefixIcon: Icon(
            Icons.search,
            size: 18,
            // color: Color.fromARGB(255, 0, 0, 0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          labelStyle: TextStyle(fontSize: 9),
          hintStyle: TextStyle(
            fontSize: 12,
            //  color: Color.fromARGB(255, 0, 0, 0),
          ),
          hintText: hintText),
    ),
  );
}

Container homeSearchField(
    context, Function(String) searchOnChange, String hintText) {
  return Container(
    padding: EdgeInsets.only(left: 24, right: 24),
    height: 32.0,
    child: TextField(
      onChanged: (value) {
        searchOnChange(value);
      },
      decoration: InputDecoration(
        filled: true,
        //fillColor: Color.fromARGB(255, 255, 255, 255),
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          size: 18,
          // color: Color.fromARGB(255, 0, 0, 0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        hintStyle: TextStyle(
          fontSize: 12,
          //  color: Color.fromARGB(255, 0, 0, 0),
        ),
        hintText: hintText,
      ),
    ),
  );
}
