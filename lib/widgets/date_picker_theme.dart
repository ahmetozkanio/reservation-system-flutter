import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

DatePickerTheme customDatePickerTheme(context) {
  return DatePickerTheme(
    backgroundColor: Theme.of(context).secondaryHeaderColor,
    cancelStyle: TextStyle(
      color: Theme.of(context).textTheme.bodyLarge?.color,
    ),
    doneStyle:
        TextStyle(color: Theme.of(context).buttonTheme.colorScheme?.primary),
    itemStyle:
        TextStyle(color: Theme.of(context).buttonTheme.colorScheme?.primary),
  );
}
