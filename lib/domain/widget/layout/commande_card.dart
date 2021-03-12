import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/commande/command_args.dart';

class CommandeCard extends StatelessWidget{
  final CommandeArgs args;
  final Function onPressed;

  const CommandeCard({Key key, this.args, this.onPressed}) : super(key: key);
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
                    title: Text(args.nomProduit,style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("prix Total"),
                    trailing: IconButton(icon: Icon(Icons.delete,color: Colors.red,),onPressed: (){this.onPressed();},),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        child: Text("Qte Bouteille:_"+args.qte.toString()??""),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        child: Text("Qte Casier_"+args.qtec.toString()??""),
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