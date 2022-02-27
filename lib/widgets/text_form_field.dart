import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextFormField textFormField(
  String labelText,
  TextInputType textInputType,
  TextEditingController textEditingController,
  List<TextInputFormatter>? inputFormatter,
  String? Function(String?) validator,
) {
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      labelText: labelText,
    ),
    inputFormatters: inputFormatter,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    keyboardType: textInputType,
    controller: textEditingController,
    validator: validator,
  );
}
