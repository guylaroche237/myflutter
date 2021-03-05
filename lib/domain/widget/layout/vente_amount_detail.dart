
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/vente.dart';

class VenteAmountDetail extends StatelessWidget {
  final Vente livraison;

  const VenteAmountDetail({Key key, this.livraison}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Cout De La Vente", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        Row(
          children: [
            Container(
                padding: EdgeInsets.only(left: 5,right: 10),
                child: Icon(Icons.monetization_on)),
            Text("${livraison.prixTotal}",),
          ],
        ),
      ],
    );

  }
}