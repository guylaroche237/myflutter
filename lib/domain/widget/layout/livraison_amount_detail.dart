import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/livraison.dart';

class LivraisonAmountDetail extends StatelessWidget {
  final Livraison livraison;

  const LivraisonAmountDetail({Key key, this.livraison}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       // Text("Cout De La Livraison", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 5,right: 10),
                    child: Icon(Icons.monetization_on)),
                Text("Cout De La Livraison", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
              ],
            ),
            Text("${livraison.prixTotal}",),
          ],
        ),
      ],
    );

  }
}