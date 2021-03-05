import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/commande/command_args.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';

class CommandeLivrerCard extends StatelessWidget{
  final CommandeArgs args;
  final Function onPressed;

  const CommandeLivrerCard({Key key, this.args, this.onPressed}) : super(key: key);
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
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(args.nomProduit,style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                subtitle: Text("prix Total"),
               // trailing: IconButton(icon: Icon(Icons.edit,color: Colors.blue,),onPressed: (){this.onPressed();},),

              ),
            ),
            Divider(height: 8,),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Qte Cmd : "+args.qte.toString()),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Qte Lvr :"),
                        Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.blueGrey),
                            child: Center(child: Text("35")))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}