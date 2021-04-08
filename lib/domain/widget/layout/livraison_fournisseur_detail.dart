
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/livraison.dart';

class LivraisonFournisseurDetail extends StatelessWidget {
  final Livraison livraison;

  const LivraisonFournisseurDetail({Key key, this.livraison}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      //  Text("Nom Fournisseur", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 5,right: 10),
                    child: Icon(Icons.account_circle)),
                Text("Nom Fournisseur", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
              ],
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.brown,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(right: 1),
                child: Center(child: Container(padding: EdgeInsets.all(5),child: Text((livraison.commande.fournisseur == null)?"No Value":"${livraison.commande.fournisseur.nom}",)))),

          ],
        ),
      ],
    );

  }
}