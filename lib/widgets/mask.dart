import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var phoneMask = MaskTextInputFormatter(
    mask: '###########',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);
List<TextInputFormatter> phoneInputFormatter = [phoneMask];
List<TextInputFormatter> inputNumber = [
  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
];
