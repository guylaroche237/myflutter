import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/model/commande.dart';
import 'package:myflutter/model/produit.dart';

class CommandLayoutCard extends StatelessWidget{
  final Commande commande;
  final Function onPressed;

  const CommandLayoutCard({Key key, this.commande,this.onPressed}) : super(key: key);
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
                title: Text(this.commande.libelle),
                trailing:  Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      shape: BoxShape.circle
                  ),
                  child: Container(
                      padding: EdgeInsets.all(1),
                      child: Center(child: Text((this.commande.detailsCommande == null)?"0":this.commande.detailsCommande.length.toString(),style: TextStyle(color: Colors.white),))),
                ),
                onTap: (){
                  this.onPressed();
                },
                leading: Icon(Icons.done_all,color: Colors.green,),
              ),
            )
          ],
        ),),
    );
  }

}