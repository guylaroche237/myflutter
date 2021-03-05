import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/widget/layout/shop_date_creation.dart';
import 'package:myflutter/domain/widget/layout/shop_localisation.dart';
import 'package:myflutter/domain/widget/layout/shop_name.dart';
import 'package:myflutter/domain/widget/layout/user_account.dart';
import 'package:myflutter/domain/widget/layout/user_plaintes.dart';
import 'package:myflutter/model/boutique.dart';
import 'package:myflutter/model/user.dart';

class ProfileScreen extends StatefulWidget{
  static const ROUTE = "profil_routes/";

  const ProfileScreen({Key key,}) : super(key: key);

  _StockScreenState createState() => _StockScreenState();

}

class _StockScreenState extends State<ProfileScreen>{
  User user = User(id: 1,nom: "Feukam",prenom: "Guy Laroche",email: "guyladrochefeu@gmail.com",telephone: "679206443");
  Boutique boutique = Boutique(nomBoutique: "Le Vestiaire",categorie: "Snack Bar",date: "22.05.2019",nomCommercial: "guy",quartier: "bonamoussadi",region: "littoral",ville: "Douala");

  bool active_parametrage = false;
  bool active_plainte = false;
  bool active_deconnexion = false;
  bool active_notification = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child:
      Container(
        height: MediaQuery.of(context).size.height - 32 - MediaQuery.of(context).padding.top,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile Detail",
                  style: ThemeHelper.heading1(color: Colors.black),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [

                  Padding(padding: EdgeInsets.symmetric(vertical: 12),child: UserAccount(user: user,),),
        
        Container(
          padding: EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height*0.46,
          child: SingleChildScrollView(

            child: Column(
              children: [
                ExpansionPanelList(
                  expansionCallback: (index,expanded){
                    print("index : ${index}");
                    setState(() {
                      if(index == 0){
                        active_parametrage = !active_parametrage;
                        active_plainte = false;
                        active_deconnexion = false;
                        active_notification = false;
                      }else if(index == 1){
                        active_parametrage = false;
                        active_plainte = ! active_plainte;
                        active_deconnexion = false;
                        active_notification = false;
                      }else if(index == 2){
                        active_parametrage = false;
                        active_plainte = false;
                        active_deconnexion = false ;
                        active_notification = !active_notification;
                      }else{
                        active_parametrage = false;
                        active_plainte = false;
                        active_deconnexion = !active_deconnexion ;
                        active_notification = false;
                      }

                    });
                  },
                  children: [
                    ExpansionPanel(headerBuilder: (BuildContext context,bool isExpanded){
                      return ListTile(
                        title: Text("Parametrage",style: TextStyle(fontWeight: FontWeight.bold),),
                        leading: Icon(Icons.settings),);
                    }, body: Column(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(vertical: 8),
                          child: ShopNameDetail(boutique: boutique,) ,),
                        Divider(height: 8,color: Colors.black,),
                        Padding(padding: EdgeInsets.symmetric(vertical: 8),
                          child: ShopLocalisationDetail(boutique: boutique,) ,
                        )
                        ,
                        Divider(height: 5,color: Colors.black,),

                        Padding(padding: EdgeInsets.symmetric(vertical: 8),
                          child: ShopDateDetail(boutique: boutique,) ,
                        )
                        ,
                      ],
                    ),
                        isExpanded: active_parametrage),
                    ExpansionPanel(headerBuilder: (BuildContext context,bool isExpanded){
                      return ListTile(
                        title: Text("Plainte",style: TextStyle(fontWeight: FontWeight.bold),),
                        leading: Icon(Icons.print),);
                    }, body: Column(
                      children: [
                        Divider(height: 5,color: Colors.black,),
                        Padding(padding: EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: UserPlaintDetail(boutique: boutique,user: user,)) ,
                        ),



                      ],
                    ),
                        isExpanded: active_plainte),
                    ExpansionPanel(headerBuilder: (BuildContext context,bool isExpanded){
                      return ListTile(
                        title: Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold),),
                        leading: Icon(Icons.notifications_active),);
                    }, body: Column(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text("Notif 1"),
                            trailing: Icon(Icons.check_circle,color: Colors.green,),
                          ) ,),
                        Divider(height: 8,color: Colors.black,),
                        Padding(padding: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text("Notif 2"),
                            trailing: Icon(Icons.check_circle,),
                          ) ,
                        )
                        ,
                        Divider(height: 5,color: Colors.black,),

                        Padding(padding: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text("Notif 3"),
                            trailing: Icon(Icons.check_circle,color: Colors.green,),
                          )  ,
                        )
                        ,
                      ],
                    ),
                        isExpanded: active_notification),

                    ExpansionPanel(headerBuilder: (BuildContext context,bool isExpanded){
                      return ListTile(title: Text("Deconnexion",style: TextStyle(fontWeight: FontWeight.bold),),
                                      leading: Icon(Icons.settings_power),);
                    }, body: Column(
                      children: [
                        Divider(height: 5,color: Colors.black,),
                        Padding(padding: EdgeInsets.symmetric(vertical: 8),
                          child: InkWell(
                            child: Row(
                              children: [
                                Icon(Icons.power_settings_new,color: Colors.green,),
                                Text("Deconnexion")
                              ],
                            ),
                          ) ,
                        )

                      ],
                    ),
                        isExpanded: active_deconnexion),

                  ],
                ),
              ],
            ),
          ),
        ),
                 /** Divider(height: 8,color: Colors.black,),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8),
                    child: ShopNameDetail(boutique: boutique,) ,),
                  Divider(height: 8,color: Colors.black,),**/



                /**  Padding(padding: EdgeInsets.symmetric(vertical: 8),
                    child: ShopLocalisationDetail(boutique: boutique,) ,
                  )
                  ,

                  Divider(height: 8,color: Colors.black,),

                    Padding(padding: EdgeInsets.symmetric(vertical: 8),
                    child: ShopDateDetail(boutique: boutique,) ,
                    )
                    ,
                    Divider(height: 8,color: Colors.black,),


                    Padding(padding: EdgeInsets.symmetric(vertical: 8),
                    child: UserPlaintDetail(boutique: boutique,user: user,) ,
                    ),
                    Divider(height: 8,color: Colors.black,),



                    Padding(padding: EdgeInsets.symmetric(vertical: 8),
                    child: InkWell(
                    child: Row(
                    children: [
                    Icon(Icons.power_settings_new,color: Colors.green,),
                    Text("Deconnexion")
                    ],
                    ),
                    ) ,
                    )
                 **/




                ],
                
              ),
            )

          ],
        ),
      ))
    );
  }

}