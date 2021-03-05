
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/stock/detail_stock_screen.dart';
import 'package:myflutter/domain/dashboard_screen/stock/stock_detail_args.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/produit.dart';

class ProduitCard extends StatelessWidget {
  final Produit produit;
  final Function onPressed;

  const ProduitCard({
    Key key,
    this.produit,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: InkWell(
        onTap: () {
          this.onPressed();
        },
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            children: <Widget>[
              Container(
                child: ListTile(
                  contentPadding: EdgeInsets.all(8),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      style: ThemeHelper.paragraph(color:produit.statusToColor),
                                      text: produit.statusMessage,
                                    ),
                                    TextSpan(style: ThemeHelper.paragraph(color: Colors.black), text: "/"+produit.nom)

                                  ]),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  produit.type,
                                  style: ThemeHelper.paragraph(
                                      color: ThemeHelper.PRIMARY_COLOR,
                                      isBold: true),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          produit.nom,
                          style: ThemeHelper.paragraph(
                              color: Colors.black, isBold: true),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${produit.fabriquant}",
                                  style: ThemeHelper.paragraph(
                                      color: ThemeHelper.PRIMARY_COLOR,
                                      isBold: true),
                                )
                              ],
                            ),
                          ),


                          // "Budget (£${job.minOfferAmount} - £${job.maxOfferAmount})",
                          Flexible(
                            flex: 2,
                            child: Text(
                              "prix achat (${produit.prixAchat1.toString()})",
                              style: ThemeHelper.paragraph(color: Colors.black),
                            )
                          )
                        ],
                      ),
                    ],
                  ),
                 // leading: Icon(Icons.local_bar),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
