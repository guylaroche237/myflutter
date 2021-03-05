

import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/widget/layout/ristourne_item.dart';
import 'package:myflutter/model/ristourne.dart';

class AllBeneficeScreen extends StatefulWidget{
  //final GlobalKey<NavigatorState> navigatorKey;
  static const ROUTE = "all_ben";
  const AllBeneficeScreen({Key key}) : super(key: key);

  _BeneficeScreenState createState() => _BeneficeScreenState();

}

class _BeneficeScreenState extends State<AllBeneficeScreen>{

  Ristourne ris = Ristourne(date: "22.09.2020",fournisseur: "Guinness",benefice: 50325,color: Colors.white,image: "assets/images/guinnes.png",bagroundColor: Colors.black);
  Ristourne ris1 = Ristourne(date: "05.09.2021",fournisseur: "Brasserie",benefice: 2525,image: "assets/images/vb.jpg",color: Colors.black,bagroundColor: Colors.orange );
  Ristourne ris2 = Ristourne(date: "22.09.2019",fournisseur: "Source Du Pays",benefice: 5325,image: "assets/images/malta.png",color: Colors.indigo,bagroundColor: Colors.white);
  Ristourne ris3 = Ristourne(date: "2.09.2020",fournisseur: "UCB",benefice: 325,image: "assets/images/ucb.jpg",color: Colors.white,bagroundColor: Colors.red);


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
                      "Benefices",
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
                  child: Center(child: Text("Somme Benefice",style: TextStyle(fontWeight: FontWeight.bold),)),

                )
              ],
            ),
          ),
        )
    );
  }

}