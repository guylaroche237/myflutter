
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/boutique.dart';

class ShopDateDetail extends StatelessWidget {
  final Boutique boutique;

  const ShopDateDetail({Key key, this.boutique}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Shop Date Creation", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        Row(

          children: [
            Container(
                padding: EdgeInsets.only(left: 5,right: 10),
                child: Icon(Icons.date_range,color: Colors.green,)),
            Text("${boutique.date}",),
          ],
        ),
      ],
    );

  }
}