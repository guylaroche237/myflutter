import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';


class BaseTextField extends StatelessWidget {
  final Function(dynamic value) onChanged;
  final Color fillColor;
  final String hintText;
  final BorderSide side;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatter;
  final String initialValue;
  final Color color;
  final int maxLines;
  final TextInputType keyboardType;
  final String Function(dynamic value) validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  const BaseTextField(
      {Key key,
      this.onChanged,
      this.fillColor = Colors.white,
      this.hintText,
      this.side = BorderSide.none,
      this.color = Colors.black,
      this.validator,
      this.obscureText = false,
      this.maxLines = 1,
      this.keyboardType,
      this.initialValue,
      this.inputFormatter,
      this.prefixIcon, this.suffixIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatter,
      maxLines: this.maxLines,
      obscureText: this.obscureText,
      initialValue: this.initialValue,
      onChanged: onChanged,
      validator: validator,
      
      keyboardType: this.keyboardType,
      style: ThemeHelper.paragraph(color: color),
      decoration: new InputDecoration(
        suffixIcon: this.suffixIcon,
        hasFloatingPlaceholder: true,
          prefixIcon: prefixIcon,
          labelText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16),
              ),
              borderSide: side),
          enabledBorder: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16),
              ),
              borderSide: side),
          filled: true,
          alignLabelWithHint: true,
          hintStyle: ThemeHelper.paragraph(color: color.withOpacity(0.8)),
          labelStyle: ThemeHelper.paragraph(color: color.withOpacity(0.8)),
          fillColor: fillColor),
    );
  }
}
