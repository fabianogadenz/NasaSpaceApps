import 'package:app_nasa/bloc/bloc.dart';
import 'package:app_nasa/data/localizacao.dart';
import 'package:app_nasa/data/rest.dart';
import 'package:app_nasa/screens/screen_instruction_one.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroOnePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var bloc = BlocHome();

  @override
  void initState() {
    bloc.initOneSignal();
    super.initState();
  }


  void _incrementCounter() {
    Rest.enviaDenuncia();
  }

//  void initOneSignal() async {
//
//    OneSignal.shared.init(await rest.getpushNotificationAppId());
//    OneSignal.shared.setExternalUserId(await rest.getpushNotificationExternalUserId());
////    OneSignal.shared.init("2c5801b4-9578-48fe-a070-403a5b0956af");
////    OneSignal.shared.setExternalUserId("APPTESTE-19697");
//    print("one signal ok");
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FlareActor("assets/flare.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:"Untitled")
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}