import 'package:flutter/material.dart';

import 'base_button.dart';


class BlackButtonOutline extends BaseButton {
  final Function onPressed;
  final Widget child;
  final String text;
  final EdgeInsets padding;
  final bool expandText;
  final bool isSmall;
  
  BlackButtonOutline(
      {this.expandText = false,
      this.padding,
      @required this.onPressed,
      this.child,
      this.text,
      this.isSmall = false})
      : super(
            borderSide: BorderSide(width: 1, color: Colors.black),
            textColor: Colors.black,
            padding: isSmall ? EdgeInsets.symmetric(horizontal: 16, vertical: 8) : padding,
            onPressed: onPressed,
            color: Colors.white,
            text: text,
            expandText: expandText,
            child: child);
}
