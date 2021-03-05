
import 'package:flutter/cupertino.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';

import 'base_button.dart';

class PrimaryButton extends BaseButton {
  final Function onPressed;
  final Widget child;
  final String text;
  final EdgeInsets padding;

  PrimaryButton({this.padding, @required this.onPressed, this.child, this.text})
      : super(
      padding: padding,
      onPressed: onPressed,
      color: ThemeHelper.PRIMARY_COLOR,
      text: text,
      child: child);
}