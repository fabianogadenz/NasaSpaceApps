import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.1,0.9],
        colors: [
        Color.fromRGBO(241, 90, 36, 1.0),
          Color.fromRGBO(237, 28, 36, 1.0),
        ],),),
      child: Container(
        child: Container(
          width: 100,
height: 100,
color: Colors.orange,
//          decoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage("assets/FirecastLogo1_branco.png"),
//            ),
//          ),
        ),
      ),
    );
  }
}
