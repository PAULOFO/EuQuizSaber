import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admob/screens/quiz_page.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'Mobile_id';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['game', 'kid'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  BannerAd myBanner = BannerAd(
    adUnitId: BannerAd.testAdUnitId,
    //adUnitId: 'ca-app-pub-7593145498964509/4760786484',
    size: AdSize.leaderboard,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );

  InterstitialAd myInterstitialAd = InterstitialAd(
    adUnitId: InterstitialAd.testAdUnitId,
    //adUnitId: 'ca-app-pub-7593145498964509/1026491387',
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );

  BannerAd _bannerAd;

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(
        appId: BannerAd.testAdUnitId
      //appId: 'ca-app-pub-7593145498964509~5395458720'
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
    myInterstitialAd.dispose();
    super.dispose();
  }

  List<String> images = [
    "images/animais.jpeg",//0
    "images/animes.jpeg",//1
    "images/atracoes_turisticas.jpg",//2
    "images/biblia.jpeg",//3
    "images/carros.jpeg",//4
    "images/celulares.jpeg",//5
    "images/cinema.jpeg",//6
    "images/pizza.jpeg",//7
    "images/desenhos.jpeg",//8
    "images/esportes.jpeg",//9
    "images/geografia.jpeg",//10
    "images/historia.jpeg",//11
    "images/ingles.jpeg",//12
    "images/literatura.jpeg",//13
    "images/musica.jpeg",//14
    "images/series1.jpeg",//15 The Witcher
    "images/series2.jpeg",//16Chaves
    "images/breaking_bad.jpeg",//17Grey's Anatomy
    "images/greysanatomy.jpeg",//Breaking Bad
    "images/tecnologia.jpeg",//18
    "images/video_games.jpeg",//19
  ];

  List<String> des = [
    "Animais",
    "Animes",
    "Atrações Turísticas",
    "Bíblia Sagrada",
    "Carros",
    "Celulares",
    "Cinema",
    "Comidas",
    "Desenhos",
    "Esportes",
    "Geografia",
    "História",
    "Inglês",
    "Literatura",
    "Música",
    "Séries-1",
    "Séries-2",
    "Séries-3",
    "Séries-4",
    "Tecnologia",
    "Video-Games",
  ];

  Widget customcard(String langname, String image, String des){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 7,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJson(langname),
          ));
        },
        child: Material(
          color: Colors.amber,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      height: 70.0,
                      width: 70.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.red[500],
                      fontFamily: "Quando",
                      fontWeight: FontWeight.bold,
                      //fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        actions: <Widget>[],
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text(
          "Escolha um tema para jogar",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Quando",
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      //drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: GridView.count(
          crossAxisCount: 3,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            customcard("Animais", images[0],des[0]),
            customcard("Animes", images[1], des[1]),
            customcard("Lugares", images[2], des[2]),
            customcard("Bíblia Sagrada", images[3], des[3]),
            customcard("Carros", images[4], des[4]),
            customcard("Celulares", images[5], des[5]),
            customcard("Cinema", images[6], des[6]),
            customcard("Comidas", images[7], des[7]),
            customcard("Desenhos", images[8], des[8]),
            customcard("Esportes", images[9], des[9]),
            customcard("Geografia", images[10], des[10]),
            customcard("História", images[11], des[11]),
            customcard("Inglês", images[12], des[12]),
            customcard("Literatura", images[13], des[13]),
            customcard("Música", images[14], des[14]),
            customcard("Séries-1", images[15], des[15]),
            customcard("Séries-2", images[16], des[16]),
            customcard("Séries-3", images[17], des[17]),
            customcard("Séries-4", images[18], des[18]),
            customcard("Tecnologia", images[19], des[19]),
            customcard("Video-Games", images[20], des[20]),
            Container(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}