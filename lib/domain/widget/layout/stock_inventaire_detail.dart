

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/inventaire.dart';

class StockInventaireDetail extends StatelessWidget {
  final Inventaire inventaire;

  const StockInventaireDetail({Key key, this.inventaire}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(padding: EdgeInsets.all(1),
        child: Column(
          children: [
            Container(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(inventaire.produitName??"",style: TextStyle(fontWeight: FontWeight.bold),),

                  ],
                ),
                subtitle: Text("prix Total"),
                trailing: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle
                  ),
                  child: Center(
                    child:  Text(inventaire.qte.toString()??""),
                  ),
                ),

              ),
            )
          ],
        ),
      ),
    );

  }
}