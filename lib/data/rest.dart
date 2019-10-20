import 'package:app_nasa/data/localizacao.dart';
import 'package:app_nasa/models/localizacao.dart';
import 'package:dio/dio.dart';

class Rest {
  static final String URL_BASE = "http://192.168.137.1:3000";
  static final String URL_BASE_INSERIR_DENUNCIA = URL_BASE + "/complaint/new";
  static final String URL_GET_STATUS = URL_BASE + "/getfireprobability";

  static Future<bool> enviaDenuncia() async {
    print("1");
    Localizacao local = await BuscaLocalizacaoAtual.buscaLocalizacao();
    print("11");
    try {
      print(URL_BASE_INSERIR_DENUNCIA);
      Response response =
          await Dio().post(URL_BASE_INSERIR_DENUNCIA, queryParameters: {
        "time": DateTime.now(),
        "latitude": local.latitude.toString(),
        "longitude": local.longitude.toString()
//        "time": "2019-10-19 17:29:00",
//        "latitude": "12.12451245",
//        "longitude": "21.5214521"
      });
      print(response.toString());
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<double> buscaStatusLatxLon() async {
    print("1");
    Localizacao local = await BuscaLocalizacaoAtual.buscaLocalizacao();
    print("11");
    print(URL_GET_STATUS +
        "?latitude=" +
        local.latitude.toString() +
        "&longitude=" +
        local.longitude.toString());
    try {
      Response response = await Dio().get(URL_GET_STATUS +
          "?latitude=" +
          local.latitude.toString() +
          "&longitude=" +
          local.longitude.toString());
      print(response.toString());
      if (response.statusCode == 200) {
        print(response.data["probability"].toDouble());
        return response.data["probability"].toDouble();

      } else {
        return 6.toDouble();
      }
    } on Exception catch (_) {
      return 6.toDouble();
    }
  }

  static Future<int> buscaStatusNomeCidade(String nomeCidade) async {
    try {
      print(URL_GET_STATUS + "?querystring=" + formataDadoString(nomeCidade));
      Response response =
          await Dio().get(URL_GET_STATUS + "?querystring=" + formataDadoString(nomeCidade));
      print(response.toString());
      if (response.statusCode == 200) {
        return response.data["probability"];
      } else {
        return 6;
      }
    } on Exception catch (_) {
      return 6;
    }
  }
  
  
  static String formataDadoString(String valor){
    valor = valor.replaceAll('á', 'a');
    valor = valor.replaceAll('ã', 'a');
    valor = valor.replaceAll('ê', 'e');
    valor = valor.replaceAll('é', 'e');
    valor = valor.replaceAll('ç', 'c');
    valor = valor.replaceAll('ó', 'o');
    valor = valor.replaceAll('í', 'i');
    valor = valor.replaceAll('ô', 'o');
    return valor;

  }
}
