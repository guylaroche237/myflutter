import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';

import 'base_dropdow_button.dart';


class PrimaryDropdownButton extends BaseDropdownButton {
  final Function(dynamic value) onChanged;
  final List<DropdownMenuItem> items;
  final String hint;

  PrimaryDropdownButton(
      {@required this.onChanged, @required this.items, @required this.hint})
      : super(
          color: ThemeHelper.PRIMARY_COLOR,
          onChanged: onChanged,
          items: items,
          hint: hint,
        );
}
