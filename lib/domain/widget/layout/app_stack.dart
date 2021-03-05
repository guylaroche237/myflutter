import 'package:flutter/material.dart';

class AppStack extends StatelessWidget {
  final double height;
  final Widget top;
  final Widget bottom;

  const AppStack({Key key, this.height, this.top, this.bottom})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          elevation: 2,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              color: Colors.white,
              width: double.infinity,
              child: this.bottom),
        ),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: this.top,
      )
    ]);
  }
}
