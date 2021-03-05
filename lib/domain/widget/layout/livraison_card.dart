
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/model/livraison.dart';

class LivraisonCard extends StatelessWidget{
  final Livraison livraison;
  final Function onPressed;

  const LivraisonCard({Key key, this.livraison, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      shadowColor: Colors.indigo,
      child: InkWell(
        onTap: () {
          this.onPressed();

        },
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Column(
            children: <Widget>[
              Container(
                child: ListTile(
                  contentPadding: EdgeInsets.all(8),
                  title: Text(this.livraison.dateLivraison,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 15),),
                  subtitle: Text(this.livraison.fournisseur,style: TextStyle(fontWeight: FontWeight.bold,),),
                  trailing: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        shape: BoxShape.circle
                    ),
                    child: Container(
                        padding: EdgeInsets.all(1),
                        child: Center(child: Text(this.livraison.quantiteProduit.toString(),style: TextStyle(color: Colors.white),))),
                  ),
                  // leading: Icon(Icons.local_bar),
                ),
              ),
              Divider(height: 8,color: Colors.black,),
              Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cout Total:"),
                    Text(this.livraison.prixTotal.toString(),style: TextStyle(color: Colors.indigo),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}