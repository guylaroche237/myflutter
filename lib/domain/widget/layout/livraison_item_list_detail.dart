
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/livraison.dart';

class LivraisonItemListDetail extends StatelessWidget {
  final Livraison livraison;

  const LivraisonItemListDetail({Key key, this.livraison}) : super(key: key);
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
              children: titles.map((e) => Card(child: ListTile(
                title: Text(e,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.indigo),),
                subtitle: Text("subTitle"),
                leading: Icon(Icons.local_bar),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Text(e.length.toString()),
                  ),
                ),)),).toList(),

              
            )
        )
      ]
    );

  }
}