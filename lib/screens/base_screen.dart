import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_page.dart';
import 'privacity_screen.dart';

class BaseScreen extends StatefulWidget {

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['game', 'kid'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-7593145498964509/4760786484',
    //adUnitId: 'ca-app-pub-7593145498964509/4760786484',
    size: AdSize.leaderboard,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );

  BannerAd _bannerAd;

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(
        //appId: BannerAd.testAdUnitId
      appId: 'ca-app-pub-7593145498964509~5395458720'
    );
    _bannerAd = myBanner
      ..load()
      ..show(
        anchorType: AnchorType.top,
        anchorOffset: 85.0,
      );
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

      return Material(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
              ),
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .7,
              //height: 450,
              //width: 300,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'EuQuizSaber',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 20,
                      fontFamily: 'Quando',
                    ),
                  ),
                  Text(
                    'Teste a você mesmo!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 18,
                      fontFamily: 'Quando',
                    ),
                  ),
                  SizedBox(height: 20,),
                  OutlineButton(
                    onPressed: (){
                      launch('https://play.google.com/store?hl=en');
                    },
                    child: Text(
                      "Mais Apps",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 32.0,
                    ),
                    borderSide: BorderSide(width: 3.0, color: Colors.red),
                    splashColor: Colors.red,
                  ),
                  SizedBox(height: 20),
                  OutlineButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PrivacityScreen(),
                      ));
                    },
                    child: Text(
                      "Privacidade",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 24.0,
                    ),
                    borderSide: BorderSide(width: 3.0, color: Colors.red),
                    splashColor: Colors.red,
                  ),
                  SizedBox(height: 20,),
                  OutlineButton(
                    onPressed: (){
                      launch('https://magazineportifolio.blogspot.com/');
                    },
                    child: Text(
                      "Sobre Nós",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 32.0,
                    ),
                    borderSide: BorderSide(width: 3.0, color: Colors.red),
                    splashColor: Colors.red,
                  ),
                  SizedBox(height: 20),
                  OutlineButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                    },
                    child: Text(
                      "Iniciar",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 50.0,
                    ),
                    borderSide: BorderSide(width: 3.0, color: Colors.red),
                    splashColor: Colors.red,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      'https://media.giphy.com/media/CaiVJuZGvR8HK/giphy.gif',
                      height: MediaQuery.of(context).size.height * .07,
                      alignment: Alignment.bottomCenter,
                      //fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
