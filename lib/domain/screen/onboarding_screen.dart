import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/widget/layout/container_with_background.dart';


class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key key}) : super(key: key);
  static const ROUTE = "onboarding";
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController(
    initialPage: 0,
  );


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
              BoxConstraints(maxHeight: mq.size.height - mq.padding.top),
              child: ContainerWithBackground(
                backgroundUrl: "assets/images/page.jpg",
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset("assets/images/page.jpg"),
                      Expanded(child: CircularProgressIndicator()),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

 /* Widget _buildItem(OnboardingScreenItem item) {
    return item.body != null
        ? item.body
        : OnboardingPage(onboardingScreenItem: item);
  }*/
}