

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/widget/layout/ristourne_item.dart';
import 'package:myflutter/model/ristourne.dart';

class AncientourneScreen extends StatefulWidget{
  //final GlobalKey<NavigatorState> navigatorKey;
  static const ROUTE = "anc_ris";
  const AncientourneScreen({Key key}) : super(key: key);

  _RistourneScreenState createState() => _RistourneScreenState();

}

class _RistourneScreenState extends State<AncientourneScreen>{
  Ristourne ris = Ristourne(date: "22.09.2020",fournisseur: "Guinness",benefice: 50325,color: Colors.black,image: "assets/images/guinn.jpg");
  Ristourne ris1 = Ristourne(date: "05.09.2021",fournisseur: "Brasserie",benefice: 2525,image: "assets/images/vb.jpg" );
  Ristourne ris2 = Ristourne(date: "22.09.2019",fournisseur: "Kadji",benefice: 5325,image: "assets/images/malta.png");
  Ristourne ris3 = Ristourne(date: "2.09.2020",fournisseur: "UCB",benefice: 325,image: "assets/images/gui.jpeg");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:  SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height - 32 - MediaQuery.of(context).padding.top,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ancien Ristourn",maxLines: 1,
                      style: ThemeHelper.heading1(color: Colors.black),
                    ),
                  ],
                ),
                Expanded(
                    child: ListView(
                      children: [
                        RistourneItem(ristourne: ris,),
                        RistourneItem(ristourne: ris1,),
                        RistourneItem(ristourne: ris2,),
                        RistourneItem(ristourne: ris3,),

                      ],
                    )),
                SizedBox(height: 8,),
                Container(
                  child: Center(child: Text("Somme ristourne",style: TextStyle(fontWeight: FontWeight.bold),)),

                )
              ],
            ),
          ),
        )
    );
  }

}