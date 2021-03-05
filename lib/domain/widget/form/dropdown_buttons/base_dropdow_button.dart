import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';


class BaseDropdownButton extends StatelessWidget {
  final Color color;
  final Function(dynamic value) onChanged;
  final List<DropdownMenuItem> items;
  final String hint;
  final Color hintColor;
  final Color borderColor;
  final EdgeInsets padding;
  final dynamic value;

  const BaseDropdownButton(
      {Key key,
      this.color = Colors.white,
      @required this.onChanged,
      @required this.items,
      @required this.hint,
        this.value,
      this.hintColor = Colors.white, this.borderColor, this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: this.padding?? EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: borderColor ?? color
          )
          ),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
        onChanged: onChanged,
        items: items,
        isDense: true,
        isExpanded: true,
        focusColor: color,
        iconEnabledColor: hintColor,
        style: ThemeHelper.paragraph(color: hintColor),
        value: value,
        hint: Text(
          hint,
          overflow: TextOverflow.ellipsis,
          style: ThemeHelper.paragraph(color: hintColor),
        ),
      )),
    );
  }
}
