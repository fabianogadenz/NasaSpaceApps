import 'package:app_nasa/models/localizacao.dart';
import 'package:location/location.dart';

class BuscaLocalizacaoAtual {
  static buscaLocalizacao() async {
    var location = new Location();
    var localizacao;
    var latitude;
    var longitude;

    try {
      localizacao = await location.getLocation();
      latitude = await localizacao["latitude"];
      longitude = await localizacao["longitude"];

      Localizacao local = new Localizacao(latitude: latitude, longitude: longitude);
      print(local.latitude);
    } catch (_) {
      return null;
    }
  }
}
//
//import 'package:app_nasa/models/localizacao.dart';
//import 'package:location/location.dart';
//
//class BuscaLocalizacaoAtual{
//  static Future<Localizacao> buscaLocalizacao() async {
//    Localizacao localizacao;
//    var location = new Location();
//    try{
//      var locationData = await location.getLocation();
//      localizacao.latitude = locationData["latitude"];
//      localizacao.longitude = locationData["longitude"];
//      print(localizacao.latitude);
//      return localizacao;
//    }  catch (_) {
//      return null;
//    }
//  }
//
//}
