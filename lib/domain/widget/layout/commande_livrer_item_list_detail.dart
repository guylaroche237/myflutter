
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/commande/command_args.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/widget/layout/commande_livrer_card.dart';
import 'package:myflutter/model/livraison.dart';

import 'commande_card.dart';

class CommandeLivrerItemListDetail extends StatelessWidget {
  final Livraison livraison;

  const CommandeLivrerItemListDetail({Key key, this.livraison}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> titles = ["Titre 1","Titre 2","Titre 3","Titre 4","Titre 5","Titre 6","Titre 7","Titre 8"];
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Liste Des Produits Livree", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
          SizedBox(height: 8),
          Container(
              padding: EdgeInsets.only(left: 5,right: 10),
              child: Column(
                children: titles.map((e) {
                  CommandeArgs cmd = CommandeArgs(nomProduit: e,qte:22,prixUnitaire: 100 );
                  // ListTile(title: Text(list[index].title),subtitle: Text(list[index].qte.toString()),);
                  return CommandeLivrerCard(args: cmd,onPressed: (){

                  },);

                 }
                ).toList(),


              )
          )
        ]
    );

  }
}