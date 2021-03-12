import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/commande/command_args.dart';
import 'package:myflutter/domain/dashboard_screen/vente/vente_args.dart';

class VenteCard extends StatelessWidget{
  final VenteArgs args;
  final Function onPressed;

  const VenteCard({Key key, this.args, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(padding: EdgeInsets.all(1),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text(args.vente.nomProduit,style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("prix Total"),
                    trailing: IconButton(icon: Icon(Icons.delete,color: Colors.red,),onPressed: (){this.onPressed();},),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        child: Text("Quantite"),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        child: Text(args.vente.quantiteProduit.toString()),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}