import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';



class TextSeparator extends StatelessWidget {
  final String text;

  const TextSeparator({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(child: Divider(color: Colors.white)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            this.text,
            textAlign: TextAlign.center,
            style: ThemeHelper.heading2(),
          ),
        ),
        Expanded(child: Divider(color: Colors.white)),
      ],
    );
  }
}
