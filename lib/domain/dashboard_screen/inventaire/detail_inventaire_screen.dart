import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/widget/layout/dashboard_app_bar.dart';
import 'package:myflutter/domain/widget/layout/head_inventaire_detail.dart';
import 'package:myflutter/domain/widget/layout/inventaire_date_detail.dart';
import 'package:myflutter/domain/widget/layout/stock_inventaire_detail.dart';
import 'package:myflutter/model/inventaire.dart';

class DetailInventaireScreen extends StatelessWidget{
 final Inventaire inventaire;
 static const ROUTE = "/details/inv";

  const DetailInventaireScreen({Key key, this.inventaire}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  dahshboardAppBar(context, title: "Detail Inventaire"),
      body: Container(
        height: MediaQuery.of(context).size.height - 100,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadInventaireDetail(inventaire: this.inventaire,),
                  SizedBox(height: 5,),
                  Divider(color: Colors.black,),
                  InventaireDateDetail(inventaire: this.inventaire,),
                  SizedBox(height: 5,),
                  Divider(color: Colors.black,),
                  Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: MediaQuery.of(context).size.height*0.5,
                      child: ListView(children: [
                        StockInventaireDetail(inventaire: this.inventaire,),
                        StockInventaireDetail(inventaire: this.inventaire,),
                        StockInventaireDetail(inventaire: this.inventaire,),
                        StockInventaireDetail(inventaire: this.inventaire,),
                        StockInventaireDetail(inventaire: this.inventaire,),
                      ],)
                  )

                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}