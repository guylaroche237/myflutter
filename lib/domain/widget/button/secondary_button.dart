import 'package:flutter/cupertino.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';

import 'base_button.dart';

class SecondaryButton extends BaseButton {
  final Function onPressed;
  final Widget child;
  final String text;

  SecondaryButton({@required this.onPressed, this.child, this.text})
      : super(
            onPressed: onPressed,
            color: ThemeHelper.SECONDARY_COLOR,
            text: text,
            child: child);
}
