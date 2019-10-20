import 'package:app_nasa/data/localizacao.dart';
import 'package:app_nasa/models/localizacao.dart';
import 'package:dio/dio.dart';

class Rest{
  static final String URL_BASE = "http://192.168.137.1:3000";
  static final String URL_BASE_INSERIR_DENUNCIA = URL_BASE+"/complaint/new";


  static Future<bool> enviaDenuncia() async {
    print("1");
    Localizacao local =await BuscaLocalizacaoAtual.buscaLocalizacao();
    print("11");
    try {
      print(URL_BASE_INSERIR_DENUNCIA);
      Response response = await Dio().post(URL_BASE_INSERIR_DENUNCIA, queryParameters: {
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

}