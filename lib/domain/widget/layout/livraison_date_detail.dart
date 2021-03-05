import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/livraison.dart';

class LivraisonDateDetail extends StatelessWidget {
  final Livraison livraison;

  const LivraisonDateDetail({Key key, this.livraison}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      //  Text("Date De Livraison", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5,right: 10),
                    child: Icon(Icons.date_range)),
                Text("Date De Livraison", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
              ],
            ),
            Text("${livraison.dateLivraison}",),
          ],
        ),
      ],
    );

  }
}