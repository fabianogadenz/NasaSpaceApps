import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  double height = 320.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Center(
            child:
            AnimatedContainer(
              duration: Duration(seconds: 10),
              width: 60.0,
              height: height,
              color: Color(0xff14ff65),
            ),
          ),
          FlatButton(
            child: Text('H'),
            color: Colors.red,
            onPressed: (){
              setState(() {
                height = 0.0;
              });
            },
          )
        ],
      )
    );
  }
}
