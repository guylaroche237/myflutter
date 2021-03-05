import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/produit.dart';

class StockAmount extends StatelessWidget {
  final Produit produit;

  const StockAmount({Key key, this.produit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Prix Vente", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        Text("${produit.prixVente.toString()}", style: ThemeHelper.price(color: Colors.black)),
        Divider(height: 8,color: Colors.red,),

        Text("Prix Achat1", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        Text("${produit.prixAchat1.toString()}", style: ThemeHelper.price(color: Colors.black)),
        Divider(height: 8,color: Colors.red,),

        Text("Prix Achat2", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        Text("${produit.prixAchat2.toString()}", style: ThemeHelper.price(color: Colors.black)),
        Divider(height: 8,color: Colors.red,),

        Text("Prix Achat3", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        Text("${produit.prixAchat3.toString()}", style: ThemeHelper.price(color: Colors.black)),
        Divider(height: 8,color: Colors.red,),

        Text("Prix Achat4", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        Text("${produit.prixAchat4.toString()}", style: ThemeHelper.price(color: Colors.black)),
        Divider(height: 8,color: Colors.red,)
      ],
    );
    // £${job.minOfferAmount.toString()} - £${job.maxOfferAmount.toString()}
  }
}