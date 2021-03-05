import 'package:flutter/material.dart';

class ContainerWithBackground extends StatelessWidget {
  final String backgroundUrl;
  final Widget child;

  ContainerWithBackground({@required this.backgroundUrl, @required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.png"))),
        child: child);
  }
}
