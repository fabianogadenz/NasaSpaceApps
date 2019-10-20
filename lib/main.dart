import 'package:app_nasa/bloc/bloc.dart';
import 'package:app_nasa/screens/lista_cidade.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaCidadesScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {


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
//    Share.text('my text title', 'This is my text to share with other applications.', 'text/plain');

//    Rest.enviaDenuncia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("oapa"),
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