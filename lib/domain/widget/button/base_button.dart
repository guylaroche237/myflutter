import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final String text;
  final Color color;
  final Color textColor;
  final BorderSide borderSide;
  final EdgeInsets padding;
  final bool expandText;
  const BaseButton(
      {Key key,
      @required this.onPressed,
      this.child,
      this.text,
      this.color,
      this.textColor,
      this.padding,
      this.borderSide,
      this.expandText = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: StadiumBorder(side: this.borderSide ?? BorderSide.none),
        elevation: 1,
        padding:
            this.padding ?? EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        color: color,
        child: this.child != null ? this.child : _buildText(text),
        onPressed: onPressed);
  }

  Widget _buildText(String text) {
    Text textWidget = Text(
      text,
      style: TextStyle(color: this.textColor ?? Colors.white,fontSize: 14),
    );
    return !this.expandText
        ? FittedBox(child: textWidget)
        : Container(width: double.infinity, child: textWidget);
  }
}
