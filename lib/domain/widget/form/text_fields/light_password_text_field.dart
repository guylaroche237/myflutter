import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myflutter/domain/helpers/app_helper.dart';


import 'light_text_field.dart';

class LightPasswordTextField extends StatefulWidget {
  LightPasswordTextField(
      {Key key, this.onChanged, this.hintText, this.validator})
      : super(key: key);
  final Function(String) onChanged;
  final Function(String) validator;
  final String hintText;
  @override
  State<StatefulWidget> createState() {
    return LightPasswordTextFieldState();
  }
}

class LightPasswordTextFieldState extends State<LightPasswordTextField> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    return LightTextField(
      suffixIcon: this._visible
          ? IconButton(
              color: Colors.white,
              icon: Icon(Icons.remove_red_eye),
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
                removeFocus(context);
              })
          : IconButton(
              color: Colors.white,
            icon: Icon(FontAwesomeIcons.eye),
              onPressed: () {
                setState(() => _visible = !_visible);
                removeFocus(context);
              },
            ),
      obscureText: !_visible,
      hintText: widget.hintText ?? "Your Password",
      onChanged: (value) {
        setState(() {
          widget.onChanged(value);
        });
      },
      validator: (value) {
        return widget.validator(value);
      },
    );
  }
}
