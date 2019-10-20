import 'package:app_nasa/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import 'lista_cidade.dart';
class IntroOnePage extends StatelessWidget {
  static final String path =
      "lib/src/pages/onboarding/smart_wallet_onboarding.dart";
  final pages = [
    PageViewModel(
      pageColor: Color.fromRGBO(230, 230, 245, 1.0),
      bubbleBackgroundColor: Color.fromRGBO(237, 28, 36, 1.0),
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Consulte a probabilidade\nde incêndio na sua \nlocalidade',
            style: TextStyle(fontSize: 25.0,color: Color.fromRGBO(237, 28, 36, 1.0),fontWeight: FontWeight.bold,fontFamily: 'Bahnschrift'),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/Imagem-01.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color.fromRGBO(240, 240, 240, 1.0),
      bubbleBackgroundColor: Color.fromRGBO(237, 28, 36, 1.0),
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Informe um principio \nde incêndio para \nas autoridades locais',
            style: TextStyle(fontSize: 25.0,color: Color.fromRGBO(237, 28, 36, 1.0),fontWeight: FontWeight.bold,fontFamily: 'Bahnschrift'),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/Imagem-02.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color.fromRGBO(230, 230, 245, 1.0),
      bubbleBackgroundColor: Color.fromRGBO(237, 28, 36, 1.0),
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Compartilhe informações \nsobre probabilidade \nde incêndio',
            style: TextStyle(fontSize: 25.0,color: Color.fromRGBO(237, 28, 36, 1.0),fontWeight: FontWeight.bold,fontFamily: 'Bahnschrift'),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/Imagem-03.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListaCidadesScreen()),
                );
              },
              showSkipButton: false,
              doneText: Text(
                "Entendi!",
              ),
              pageButtonsColor: Color.fromRGBO(237, 28, 36, 1.0),
              pageButtonTextStyles: new TextStyle(
                // color: Colors.indigo,
                fontSize: 16.0,
                fontFamily: "Regular",
              ),
            ),

          ],
        ),
      ),
    );
  }
}
