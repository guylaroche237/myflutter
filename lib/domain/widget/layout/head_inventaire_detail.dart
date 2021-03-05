
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/inventaire.dart';

class HeadInventaireDetail extends StatelessWidget {
  final Inventaire inventaire;

  const HeadInventaireDetail({Key key, this.inventaire}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Information Primaire", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 75,
              height: 75,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue
              ),
              child: ClipOval(child: Image.asset(inventaire.images,width: 65,height: 65,fit: BoxFit.cover,)),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.5,
              padding: EdgeInsets.only(left: 5,right: 10),
              child: ListTile(title: Text(inventaire.createurName),subtitle: Text("Point Vente"),)
              
            )

          ],
        ),
      ],
    );

  }
}