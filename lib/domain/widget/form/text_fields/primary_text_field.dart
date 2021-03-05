import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';


import 'base_text_field.dart';

class PrimaryTextField extends BaseTextField {
  final Function(dynamic value) onChanged;
  final String hintText;
  final String Function(dynamic value) validator;
  final bool obscureText;

  PrimaryTextField(
      {this.obscureText = false, this.hintText, this.onChanged, this.validator})
      : super(
            obscureText: obscureText,
            hintText: hintText,
            validator: validator,
            onChanged: onChanged,
            fillColor: ThemeHelper.PRIMARY_COLOR,
            color: Colors.white);
}
