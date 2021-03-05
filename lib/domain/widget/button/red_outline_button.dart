import 'package:flutter/material.dart';

import 'base_button.dart';


class RedButtonOutline extends BaseButton {
  final Function onPressed;
  final Widget child;
  final String text;
  final EdgeInsets padding;
  final bool expandText;
  final bool isSmall;
  
  RedButtonOutline(
      {this.expandText = false,
      this.padding,
      @required this.onPressed,
      this.child,
      this.text,
      this.isSmall = false})
      : super(
            borderSide: BorderSide(width: 1, color: Colors.red),
            textColor: Colors.red,
            padding: isSmall ? EdgeInsets.symmetric(horizontal: 16, vertical: 8) : padding,
            onPressed: onPressed,
            color: Colors.white,
            text: text,
            expandText: expandText,
            child: child);
}
