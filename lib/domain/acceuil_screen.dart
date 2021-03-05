import 'package:flutter/material.dart';
import 'package:myflutter/domain/widget/button/primary_button.dart';

import 'continue_as_screen.dart';


class AcceuilScreen extends StatefulWidget {
  static const ROUTE = "/acceuil";
  @override
  State<StatefulWidget> createState() {
    return AcceuilScreenState();
  }
}

class AcceuilScreenState extends State<AcceuilScreen> {
  @override
  void initState() {
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 1),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset("assets/images/acceuil.jpg"),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.account_balance,color: Colors.black,),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Text("Mashop Application",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  )
                                ],
                              ),
                            ),
                            Divider(height: 5,color: Colors.black,),
                            Container(
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.announcement,color: Colors.green,),
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      child: Text("Application de suivie de vente")

                                  )
                                ],
                              ),
                            ),
                            Divider(height: 5,color: Colors.black,),
                            Container(
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on,color: Colors.amber,),
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      child: Text("Cameroun")

                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 50,),
                      width: MediaQuery.of(context).size.width*0.8,

                      child: PrimaryButton(
                        child: Text('Start',style: TextStyle(color: Colors.white),),
                        onPressed: (){
                       //   Navigator.of(context).pushReplacementNamed(ContinueAsScreen.ROUTE);
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ContinueAsScreen()));
                        },
                      ),
                    )
                    //  Expanded(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}
