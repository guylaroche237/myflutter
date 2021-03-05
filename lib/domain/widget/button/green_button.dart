import 'package:flutter/cupertino.dart';

import 'base_button.dart';


class GreenButton extends BaseButton {
  final Function onPressed;
  final Widget child;
  final String text;

  GreenButton({@required this.onPressed, this.child, this.text})
      : super(
            onPressed: onPressed,
            color: Color.fromRGBO(0, 186, 74, 1),
            text: text,
            child: child);
}
