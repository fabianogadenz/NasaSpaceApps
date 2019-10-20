import 'package:app_nasa/data/rest.dart';
import 'package:app_nasa/data/uf_cidades_data.dart';
import 'package:app_nasa/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ListaCidadesScreen extends StatefulWidget {
  @override
  _ListaCidadesScreenState createState() => _ListaCidadesScreenState();
}

class _ListaCidadesScreenState extends State<ListaCidadesScreen> {
  List<String> cidades_filtradas, cidades = [];
  int qtd_cidades = 0;
  int t = 0;
  double valorMarcados = null;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (t == 0) {
        FocusScope.of(context).requestFocus(new FocusNode());
        qtd_cidades = UfCidadesData.cidadeUF.length;
        cidades_filtradas = cidades = UfCidadesData.cidadeUF;
        t++;
      }
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: new Icon(MdiIcons.bullhorn),
        backgroundColor: Colors.red[400],
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          Rest.buscaStatusNomeCidade("medianeira").then((valor) {
            print(valor);
            setState(() {
              isLoading = false;
            });
          });
        },
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://s2.glbimg.com/1Wh9VrSZokI1CoRhHpdgeTapEnI=/e.glbimg.com/og/ed/f/original/2018/02/22/cidade.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.9],
                colors: [
                  Color.fromRGBO(241, 90, 36, 0.9),
                  Color.fromRGBO(237, 28, 36, 0.9),
                ],
              ),
            ),
            child: Center(
              child: Text(
                'Busque por cidade',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(right: 20, left: 20, top: 170),
              padding: EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    cidades_filtradas = cidadesFilter(value);
                    qtd_cidades = cidades_filtradas.length;
                  });
                },
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    hintText: 'Digite o nome da cidade...'),
              ),
            ),
          ),
          !isLoading
              ? Container(
                  margin: EdgeInsets.only(top: 230),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 200,
                  child: Utils.mostraMarcador())
              : Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 130),
                      width: 100,
                      height: 100,
                      child: Utils.mostraLoading()),
                ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
          ),
        ],
      ),
    );
  }

  Widget lista_cidades() {
    return ListView.builder(
        itemCount: qtd_cidades,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(cidades_filtradas[index].toString()),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Rest.buscaStatusNomeCidade(cidades_filtradas[index].toString())
                  .then((valor) {
                print(valor);
              });
            },
            leading: CircleAvatar(
              child: Text(cidades_filtradas[index]
                  .toString()
                  .substring(0, 2)
                  .toUpperCase()),
            ),
          );
        });
  }

  static List<String> cidadesFilter(filter) {
    List<String> filtrados = [];

    for (String cidade in UfCidadesData.cidadeUF) {
      if (cidade.toLowerCase().trim().replaceAll(" ", "").contains(
          filter.toString().toLowerCase().trim().replaceAll(" ", ""))) {
        filtrados.add(cidade);
      }
    }
    return filtrados;
  }
}
