
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/vente/vente_args.dart';
import 'package:myflutter/domain/widget/layout/dashboard_app_bar.dart';
import 'package:myflutter/domain/widget/layout/vente_amount_detail.dart';
import 'package:myflutter/domain/widget/layout/vente_date_detail.dart';
import 'package:myflutter/domain/widget/layout/vente_item_list_detail.dart';

class VenteDetailScreen extends StatefulWidget {
  VenteDetailScreen({Key key, this.args}) : super(key: key);
  static const ROUTE = "/details/";
  final VenteArgs  args;

  @override
  StockDetailsSreenState createState() => StockDetailsSreenState();
}

class StockDetailsSreenState extends State<VenteDetailScreen> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: dahshboardAppBar(context, title: "Detail Vente"),
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
                        VenteDateDetail(livraison: widget.args.vente,),
                        SizedBox(height: 16),
                        Divider(
                          color: Colors.grey,
                        ),
                       /** Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: LivraisonFournisseurDetail(livraison: widget.args.livraison,),
                        ),**/

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: VenteAmountDetail(livraison: widget.args.vente,),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: VenteItemListDetail(livraison: widget.args.vente,),),

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