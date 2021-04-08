
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/agent/register_user_screen.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';

class HomeWorkerDetailScreen extends StatefulWidget{

  HomeWorkerDetailScreen({Key key}):super(key:key);
  static const ROUTE = "worker/homes";

  @override
  _WorkerHomeDetailScreenState createState() => _WorkerHomeDetailScreenState();


}

class _WorkerHomeDetailScreenState extends State<HomeWorkerDetailScreen>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);

    List<HomeInfo> listes = [
      HomeInfo(notifications: 3,title: "New User",alertMessage: "",redirect: RegisterUserScreen.ROUTE,logo: Icon(Icons.cloud_download,color: Colors.green,),),
    //  HomeInfo(notifications: 10,title: "Add Vente",alertMessage: "",redirect:"",logo: Icon(Icons.add_circle,color: Colors.green,)),
     // HomeInfo(notifications: 58,title: "Fournisseurs",alertMessage: "",redirect: "",logo: Icon(Icons.airport_shuttle,color: Colors.green,)),
    //  HomeInfo(notifications: 12,title: "Produit Vendu",alertMessage: "",redirect: "",logo: Icon(Icons.business_center,color: Colors.green,)),
     // HomeInfo(notifications: 20,title: "Produit Achete",alertMessage: "",redirect:"",logo: Icon(Icons.crop,color: Colors.green,)),
    //  HomeInfo(notifications: 22,title: "MY Shop",alertMessage: "",redirect: "",logo: Icon(Icons.local_bar,color: Colors.green,)),
    ];
    return ModalProgressHUD(
      inAsyncCall: false,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //  SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Acceuil",style: ThemeHelper.heading1(color: Colors.black)),

                    RaisedButton(
                        onPressed: () async{

                        },
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(Icons.power_settings_new,color: Colors.white,)
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(

                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: mq.size.height - mq.padding.top),
                  child: Container(
                      height: MediaQuery.of(context).size.height*75/100,
                      width: MediaQuery.of(context).size.width*90/100,
                      child: ListView.builder(
                        itemCount: (listes == null)?0:listes.length,
                        itemBuilder: (BuildContext context,int index){
                          return Container(
                            padding: EdgeInsets.all(5),
                              child: Card(
                                elevation: 15,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).pushNamed(listes[index].redirect);
                                  },
                                  child: Container(
                                    child: ListTile(
                                      title:  Container(
                                        padding: EdgeInsets.only(top: 1,bottom: 1),
                                        child: Text(listes[index].title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 15),),
                                      ),
                                      leading: listes[index].logo,
                                    ),
                                  ),
                                ),
                              )
                          );
                        },
                      )

                  ),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }



}
class HomeInfo {
  int notifications;
  String title;
  String alertMessage;
  String redirect;
  Icon logo;

  HomeInfo(
      {this.notifications, this.title, this.alertMessage, this.redirect, this.logo});
}