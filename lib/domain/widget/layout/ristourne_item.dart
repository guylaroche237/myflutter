import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/ristourne.dart';

class RistourneItem extends StatelessWidget{
  final Ristourne ristourne;

  const RistourneItem({Key key, this.ristourne}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          color: ristourne.bagroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          //image: DecorationImage(image: AssetImage(ristourne.image),fit: BoxFit.cover)   child: ClipOval(child: Image.asset(ristourne.image,width: 65,height: 65,fit: BoxFit.cover,)),

      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(bottom: 5,right: 5),

      child: Column(
        children: [
          ListTile(
            title: Text(this.ristourne.fournisseur,style: TextStyle(fontWeight: FontWeight.bold,color: ristourne.color),),
            subtitle: Text(this.ristourne.benefice.toString()+" Frs",style: TextStyle(color: ristourne.color),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 75,
                height: 75,
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  // image: DecorationImage(image: AssetImage(ristourne.image),fit: BoxFit.cover)
                ),
                child: ClipOval(child: Image.asset(ristourne.image,width: 70,height: 70,fit: BoxFit.cover,)),
              ),
              Text(this.ristourne.date,style: TextStyle(color: ristourne.color),),
            ],
          )
        ],
      ),
    );
  }
}