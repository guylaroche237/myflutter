import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'base_text_field.dart';


class BlackOutlineTextField extends BaseTextField {
  final Function(dynamic value) onChanged;
  final String hintText;
  final List<TextInputFormatter> inputFormatter;
  final String Function(dynamic value) validator;
  final bool obscureText;
  final String initialValue;
  final int maxLines;
  final TextInputType keyboardType;
  final Icon prefixIcon;

  BlackOutlineTextField(
      {this.prefixIcon,
      this.inputFormatter,
      this.initialValue,
      this.keyboardType,
      this.obscureText = false,
      this.maxLines = 1,
      @required this.hintText,
      @required this.onChanged,
      @required this.validator})
      : super(
            prefixIcon: prefixIcon,
            inputFormatter: inputFormatter,
            initialValue: initialValue,
            obscureText: obscureText,
            hintText: hintText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            validator: validator,
            onChanged: onChanged,
            fillColor: Colors.transparent,
            side: BorderSide(width: 1, color: Colors.black),
            color: Colors.black);
}
