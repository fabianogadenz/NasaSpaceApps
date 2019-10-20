import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Utils {
  static FlareActor mostraMarcador() {
    return new FlareActor("assets/marcador.flr", alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "Reduzido");
    //Reduzido , Moderado, Relevado , MuitoElevado, Extremo
  }
  static FlareActor mostraLoading() {
    return new FlareActor("assets/ProcessingLogo.flr", alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "Untitled");
    //Reduzido , Moderado, Relevado , MuitoElevado, Extremo
  }
}