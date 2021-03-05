import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'base_text_field.dart';


class LightTextField extends BaseTextField {
  final Function(dynamic value) onChanged;
  final String hintText;
  final List<TextInputFormatter> inputFormatter;
  final String Function(dynamic value) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget suffixIcon;
  final String initialValue;

  LightTextField(
      {this.suffixIcon,
      this.keyboardType,
      this.inputFormatter,
        this.initialValue,
      this.obscureText = false,
      @required this.hintText,
      @required this.onChanged,
      @required this.validator})
      : super(
            keyboardType: keyboardType,
            obscureText: obscureText,
            hintText: hintText,
            validator: validator,
            initialValue:initialValue,
            onChanged: onChanged,
            fillColor: Colors.transparent,
            side: BorderSide(width: 1, color: Colors.white),
            color: Colors.white);
}
