import 'package:flutter/material.dart';
import 'package:admob/screens/base_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with
    SingleTickerProviderStateMixin {
  ///Informa ao AnimationController toda a vez que a tela for renderizada
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BaseScreen())
        );
      }
    });//É chamado toda a vez que o estado da animação muda

    controller.forward();

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation);
  }
}

class AnimatedLogo extends AnimatedWidget {

  AnimatedLogo(Animation<double> animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'images/euquizsaber_logo.png',
          fit: BoxFit.fill,
          width: 500,
          height: animation.value,
        ),
      ),
    );
    //throw UnimplementedError();
  }
}
