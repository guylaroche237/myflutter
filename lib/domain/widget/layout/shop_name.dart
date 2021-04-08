
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/boutique.dart';
import 'package:myflutter/model/point_vente.dart';

class ShopNameDetail extends StatelessWidget {
  final PointVente boutique;

  const ShopNameDetail({Key key, this.boutique}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Shop Name", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        Row(

          children: [
            Container(
                padding: EdgeInsets.only(left: 5,right: 10),
                child: Icon(Icons.home,color: Colors.green,)),
            Text("${boutique.nomPointVente}",),
          ],
        ),
      ],
    );

  }
}