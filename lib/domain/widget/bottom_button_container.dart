import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomButtonContainer extends StatelessWidget {
  const BottomButtonContainer({Key key, this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Material(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: this.child,
            )));
  }
}