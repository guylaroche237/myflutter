

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/model/produit.dart';

class InventaireCard extends StatelessWidget{
  final Produit produit;
  final Function onPressed;

  const InventaireCard({Key key, this.produit,this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 6,
      shadowColor: Colors.green,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text(this.produit.nom),
                trailing:  Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      shape: BoxShape.circle
                  ),
                  child: Container(
                      padding: EdgeInsets.all(1),
                      child: Center(child: Text(this.produit.quantite.toString(),style: TextStyle(color: Colors.white),))),
                ),
                onTap: (){
                  this.onPressed();
                },
                leading: Icon(Icons.done_all,color: this.produit.statusToColor,),
              ),
            )
          ],
        ),),
    );
  }

}