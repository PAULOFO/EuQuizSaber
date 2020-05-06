import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admob/screens/home_page.dart';
import 'package:admob/screens/result_page.dart';
import 'package:firebase_admob/firebase_admob.dart';

class GetJson extends StatefulWidget {
  //aceite o langname como um parâmetro

  String langname;
  GetJson(this.langname);

  @override
  _GetJsonState createState() => _GetJsonState();
}

class _GetJsonState extends State<GetJson> {
  /*FirebaseAdMob.instance.initialize(appId:
    'ca-app-pub-7593145498964509~5395458720'//'ca-app-pub-7593145498964509/4760786484'
    );
    myBanner
    // normalmente isso acontece muito antes do anúncio ser exibido
      ..load()
      ..show(
        // Posiciona o anúncio em banner a 60 pixels da parte inferior da tela
        anchorOffset: 60.0,
        // Posiciona o anúncio em banner 10 pixels do centro da tela para a direita
        horizontalCenterOffset: 10.0,
        // Banner Position
        anchorType: AnchorType.bottom,
      );
    myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );*/


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
        //horizontalCenterOffset: 10.0
      );
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    myInterstitialAd.dispose();
    super.dispose();
  }

  String assettoload;

  setasset() {
    if (widget.langname == "Animais") {
      assettoload = "assets/animais.json";
    } else if (widget.langname == "Animes") {
      assettoload = "assets/animes.json";
    } else if (widget.langname == "Lugares") {
      assettoload = "assets/lugares.json";
    } else if (widget.langname == "Bíblia Sagrada") {
      assettoload = "assets/biblia_sagrada.json";
    } else if (widget.langname == "Carros") {
      assettoload = "assets/carros.json";
    } else if (widget.langname == "Celulares") {
      assettoload = "assets/celulares.json";
    } else if (widget.langname == "Cinema") {
      assettoload = "assets/cinema.json";
    } else if (widget.langname == "Comidas") {
      assettoload = "assets/comidas.json";
    } else if (widget.langname == "Desenhos") {
      assettoload = "assets/desenhos.json";
    } else if (widget.langname == "Esportes") {
      assettoload = "assets/esportes.json";
    } else if (widget.langname == "Geografia") {
      assettoload = "assets/geografia.json";
    } else if (widget.langname == "História") {
      assettoload = "assets/historia.json";
    } else if (widget.langname == "Inglês") {
      assettoload = "assets/ingles.json";
    } else if (widget.langname == "Literatura") {
      assettoload = "assets/literatura.json";
    } else if (widget.langname == "Música") {
      assettoload = "assets/musica.json";
    } else if (widget.langname == "Séries-1") {
      assettoload = "assets/series-1.json";
    } else if (widget.langname == "Séries-2") {
      assettoload = "assets/series-2.json";
    } else if (widget.langname == "Séries-3") {
      assettoload = "assets/series-3.json";
    } else if (widget.langname == "Séries-4") {
      assettoload = "assets/series-4.json";
    } else if (widget.langname == "Tecnologia") {
      assettoload = "assets/tecnologia.json";
    } else if (widget.langname == "Video-Games"){
      assettoload = "assets/video_games.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    // essa função é chamada antes da construção para que
    // a string assettoload é available para o DefaultAssetBuilder
    setasset();
    // and now we return the FutureBuilder to load and decode JSON
    return FutureBuilder(
      future:
      DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            appBar: AppBar(
                title: Text('Responda')),
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return QuizPage(mydata: mydata);
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget {

  var mydata;

  QuizPage({Key key, @required this.mydata}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState(mydata);
}

class _QuizPageState extends State<QuizPage> {

  var mydata;
  _QuizPageState(this.mydata);

  Color colortoshow = Colors.black12;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  // extra varibale to iterate
  int j = 1;
  int timer = 30;
  String showtimer = "30";

  Map<String, Color> btncolor = {
    "a": Colors.amber,
    "b": Colors.amber,
    "c": Colors.amber,
    "d": Colors.amber,
  };

  bool canceltimer = false;

  // código inserido para escolher perguntas aleatoriamente
  // para criar os elementos da matriz aleatoriamente, use o módulo dart:math
  // -----     CODE TO GENERATE ARRAY RANDOMLY

  // import 'dart:math';

  //   var random_array;
  //   var distinctIds = [];
  //   var rand = new Random();
  //     for (int i = 0; ;) {
  //     distinctIds.add(rand.nextInt(10));
  //       random_array = distinctIds.toSet().toList();
  //       if(random_array.length < 10){
  //         continue;
  //       }else{
  //         break;
  //       }
  //     }
  //   print(random_array);

  // ----- END OF CODE
  var random_array = [01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

  // substituindo a função initstate para iniciar o temporizador conforme esta tela é criada
  @override
  void initState() {
    starttimer();
    super.initState();
  }

  // substituindo a função setstate a ser chamada apenas se montada
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (j < 20) {
        i = random_array[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.amber;
      btncolor["b"] = Colors.amber;
      btncolor["c"] = Colors.amber;
      btncolor["d"] = Colors.amber;
    });
    starttimer();
  }

  void checkanswer(String k) {
    // in the previous version this was
    // mydata[2]["1"] == mydata[1]["1"][k]
    // which i forgot to change
    // so nake sure that this is now corrected
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      // just a print sattement to check the correct working
      // debugPrint(mydata[2][i.toString()] + " is equal to " + mydata[1][i.toString()][k]);
      marks = marks + 5;
      // changing the color variable to be green
      colortoshow = right;
    } else {
      // just a print sattement to check the correct working
      // debugPrint(mydata[2]["1"] + " is equal to " + mydata[1]["1"][k]);
      colortoshow = wrong;
    }
    setState(() {
      // applying the changed color to the particular button that was selected
      btncolor[k] = colortoshow;
      canceltimer = true;
    });

    // changed timer duration to 1 second
    Timer(Duration(seconds: 1), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.red,
            fontFamily: "Alike",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.white  ,
        highlightColor: Colors.amberAccent,//Colors.indigo[700],
        minWidth: 450.0,
        height: 45.0,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "QuizSaber",
              ),
              content: Text("Você não pode voltar nesta fase."),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ok',
                  ),
                )
              ],
            ));
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(2.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()],
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: "Quando",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Expanded(
                child: Image.network(
                  'https://media.giphy.com/media/CaiVJuZGvR8HK/giphy.gif',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d'),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FlatButton(
                          onPressed: (){
                            _exitbutton();
                          },
                          child: Icon(Icons.home,
                          color: Colors.white,
                          size: 40,
                          ),
                      ),
                    ),
                    Container(
                      child: ClipOval(
                        child: Container(
                          width: 40,
                          height: 40,
                          color: Colors.red,
                          child: Center(
                            child: Text(showtimer,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Times New Roman',
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _exitbutton() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => HomePage(),
    ));
  }
}
