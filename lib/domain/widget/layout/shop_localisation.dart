
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/boutique.dart';

class ShopLocalisationDetail extends StatelessWidget {
  final Boutique boutique;

  const ShopLocalisationDetail({Key key, this.boutique}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Shop Localisation", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        Container(
          child: Row(

            children: [
              Container(padding: EdgeInsets.only(left: 5,right: 10), child: Icon(Icons.location_on,color: Colors.green,)),
              Container(
                child: Text(this.boutique.quartier+"_/"+this.boutique.ville+"_/"+this.boutique.region),
              )

            ],
          ),
        ),
      ],
    );

  }
}