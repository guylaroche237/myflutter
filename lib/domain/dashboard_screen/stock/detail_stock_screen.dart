

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/stock/stock_detail_args.dart';
import 'package:myflutter/domain/widget/button/primary_button.dart';
import 'package:myflutter/domain/widget/layout/dashboard_app_bar.dart';
import 'package:myflutter/domain/widget/layout/stock_amount.dart';

class DetailsStockScreen extends StatefulWidget {
  DetailsStockScreen({Key key, this.args}) : super(key: key);
  static const ROUTE = "stock/details/";
  final StockDetailArgs  args;

  @override
  StockDetailsSreenState createState() => StockDetailsSreenState();
}

class StockDetailsSreenState extends State<DetailsStockScreen> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: dahshboardAppBar(context, title: "Detail Stock"),
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: Container(
            height: MediaQuery.of(context).size.height - 100,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text("Nom Produit"),
                          subtitle: Text(widget.args.produit.nom),
                        ),
                        SizedBox(height: 16),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: StockAmount(produit: widget.args.produit),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(widget.args.produit.statusMessage??"vide"),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),

// Laroche : Affiche les boutons Edit et Delete sauf si ce job n a pas encore ete bider
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: PrimaryButton(
                      text: "Commander",
                      onPressed: () {
                      },
                    ))
              ],
            )),
      ),
    );
  }
}