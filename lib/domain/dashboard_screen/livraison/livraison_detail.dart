
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/livraison/livraison_args.dart';
import 'package:myflutter/domain/widget/layout/dashboard_app_bar.dart';
import 'package:myflutter/domain/widget/layout/livraison_amount_detail.dart';
import 'package:myflutter/domain/widget/layout/livraison_date_detail.dart';
import 'package:myflutter/domain/widget/layout/livraison_fournisseur_detail.dart';
import 'package:myflutter/domain/widget/layout/livraison_item_list_detail.dart';

class DetailsLivraisonScreen extends StatefulWidget {
  DetailsLivraisonScreen({Key key, this.args}) : super(key: key);
  static const ROUTE = "/details/";
  final LivraisonArgs  args;

  @override
  StockDetailsSreenState createState() => StockDetailsSreenState();
}

class StockDetailsSreenState extends State<DetailsLivraisonScreen> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: dahshboardAppBar(context, title: "Detail Livraison"),
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
                        LivraisonDateDetail(livraison: widget.args.livraison,),
                        SizedBox(height: 16),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: LivraisonFournisseurDetail(livraison: widget.args.livraison,),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: LivraisonAmountDetail(livraison: widget.args.livraison,),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: LivraisonItemListDetail(livraison: widget.args.livraison,),),



                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}