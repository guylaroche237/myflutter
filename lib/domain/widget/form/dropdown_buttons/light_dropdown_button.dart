import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';


import 'base_dropdow_button.dart';

class LightDropdownButton extends BaseDropdownButton {
  final Function(dynamic value) onChanged;
  final List<DropdownMenuItem> items;
  final String hint;

  LightDropdownButton(
      {@required this.onChanged, @required this.items, @required this.hint})
      : super(
          hintColor: ThemeHelper.LIGHT_COLOR,
          color: Colors.transparent,
          onChanged: onChanged,
          borderColor: Colors.white,
          items: items,
          hint: hint,
        );
}
