import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Utils {
  static FlareActor mostraMarcador(double valor) {
    String animacao = "Reduzido";
    print(valor.toString());
    if (valor <= 0.2)
      animacao = "Reduzido";
    else if (valor<= 0.4)
      animacao = "Moderado";
    else if (valor <= 0.6)
      animacao = "Relevado";
    else if (valor <= 0.8)
      animacao = "MuitoElevado";
    else if (valor <= 1.0)
      animacao = "Extremo";

    return new FlareActor("assets/marcador.flr",
        alignment: Alignment.center, fit: BoxFit.contain, animation: animacao);
    //Reduzido , Moderado, Relevado , MuitoElevado, Extremo
  }

  static FlareActor mostraLoading() {
    return new FlareActor("assets/ProcessingLogo.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "Untitled");
    //Reduzido , Moderado, Relevado , MuitoElevado, Extremo
  }
}
