import 'package:app_nasa/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroOnePage extends StatelessWidget {
  static final String path =
      "lib/src/pages/onboarding/smart_wallet_onboarding.dart";
  final pages = [
    PageViewModel(
      pageColor: Color.fromRGBO(240, 240, 240, 1.0),
      bubbleBackgroundColor: Colors.orange,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Consulte a probabilidade\nde incêndio na sua \nlocalidade.',
            style: TextStyle(fontSize: 25.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/234049726023202.jpg',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color.fromRGBO(240, 240, 240, 1.0),
      bubbleBackgroundColor: Colors.orange,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Informe um principio \nde incêndio para \nas autoridades locais.',
            style: TextStyle(fontSize: 25.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/234049726023202.jpg',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor:Color.fromRGBO(240, 240, 240, 1.0),
      bubbleBackgroundColor: Colors.orange,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Compartilhe informacoes sobre probabilidade de incêndio.',
            style: TextStyle(fontSize: 25.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/234049726023202.jpg',
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
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              showSkipButton: false,
              doneText: Text(
                "Get Started",
              ),
              pageButtonsColor: Colors.indigo,
              pageButtonTextStyles: new TextStyle(
                // color: Colors.indigo,
                fontSize: 16.0,
                fontFamily: "Regular",
              ),
            ),
            Positioned(
                top: 20.0,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child:
                Image.asset(
                  'assets/234049726023202.jpg',
                  width: 100,
                )
            )
          ],
        ),
      ),
    );
  }
}
