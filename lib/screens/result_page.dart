import 'package:flutter/material.dart';
import 'package:admob/screens/home_page.dart';

class ResultPage extends StatefulWidget {
  int marks;
  ResultPage({Key key , @required this.marks}) : super(key : key);
  @override
  _ResultPageState createState() => _ResultPageState(marks);
}

class _ResultPageState extends State<ResultPage> {

  List<String> images = [
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;

  @override
  void initState(){
    if(marks < 20){
      image = images[2];
      message = "Hum! Você deve se esforçar...\n" + "Você pontuou apenas $marks pontos!";
    }else if(marks < 35){
      image = images[1];
      message = "Hey! \nContinue...\n" + "Você pontuou apenas $marks pontos!";
    }else if(marks < 60){
      image = images[1];
      message = "Wow! Está progredindo!\n" + "Você pontuou $marks pontos!";
    }else if(marks < 99){
      image = images[1];
      message = "Legal! Quase perfeito..\n" + "Você pontuou $marks pontos!";
    }else{
      image = images[0];
      message = "Parabéns por acertar todas as perguntas!\n" + "Você pontuou $marks pontos!";
    }
    super.initState();
  }

  int marks;
  _ResultPageState(this.marks);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text(
            "Resultado",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              elevation: 0.0,
              child: Container(
                color: Colors.amber,
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Padding(
                        padding: const EdgeInsets.all(80.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 40),
                          //decoration: BoxDecoration(
                            //color: Colors.amber,
                            //borderRadius: BorderRadius.circular(15),
                          //),
                          width: 100.0,
                          height: 100.0,
                          child: ClipRect(
                            child: Image(
                              image: AssetImage(
                                image,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 5.0,
                      ),
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Quando",
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          backgroundColor: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                    },
                    child: Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                        },
                        child: Text(
                          'Continuar',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Alike",
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                        color: Colors.amber,
                        splashColor: Colors.amberAccent,
                        highlightColor: Colors.redAccent,//Colors.indigo[700],
                        minWidth: 300.0,
                        height: 45.0,
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}