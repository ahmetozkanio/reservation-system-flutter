import 'package:flutter/material.dart';

Container searchTextField(Function(String) searchOnChange, String hintText) {
  return Container(
    padding: EdgeInsets.only(left: 24, right: 24),
    height: 56,
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
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none),
          hintStyle:
              TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
          hintText: hintText),
    ),
  );
}
