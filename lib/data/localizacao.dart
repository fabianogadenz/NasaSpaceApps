import 'package:app_nasa/models/localizacao.dart';
import 'package:location/location.dart';

class BuscaLocalizacaoAtual {
  static Future<Localizacao> buscaLocalizacao() async {
    var location = new Location();
    var localizacao;
    var latitude;
    var longitude;

    try {
      localizacao = await location.getLocation();
      latitude = await localizacao["latitude"];
      longitude = await localizacao["longitude"];

      Localizacao local =
          new Localizacao(latitude: latitude, longitude: longitude);
      print(local.latitude);
      return local;
    } catch (_) {
      return null;
    }
  }
}