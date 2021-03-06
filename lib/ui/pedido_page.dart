import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:holistic_abadi_app/ui/pedido_graph.dart';
import 'package:http/http.dart' as http;

const request = "http://172.20.49.50:8972/pedidos/pedidosbase";
String base;
String _search;

class PedidoPage extends StatefulWidget {
  @override
  _PedidoPageState createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  String base;
  String descricao;
  Future<Map> getDados() async {
    http.Response response; // definindo a resposta do rest
    response = await http.get(request);
    return jsonDecode(response.body);
  }

  bool _value1 = false;
  void _value1Change(bool value) => setState(() => _value1 = value);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(15, 1, 12, 1),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Pesquise a Filial",
                      suffixIcon: Icon(Icons.search)),
                      onSubmitted: (text){

                      setState(() {
                        _search=text;
                      });

                      },
                ),
              ),
            /*  RaisedButton(
                onPressed: () {},
                child: Text("Buscar"),
              ),*/
              Checkbox(value: _value1, onChanged: _value1Change),
              Text("Todas")
            ],
          ),
        ),
        Expanded(
            child: FutureBuilder<Map>(
                future: getDados(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: Text(
                          "Carregando dados...",
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Erro ao carregar dados. :(",
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      } else {

                        if (_search==null){
                        return ListView.builder(
                            padding: EdgeInsets.only(top: 10),
                            itemCount: snapshot.data["bases"].length,
                            itemBuilder: (context, index) {

                              List<String> base = new List<String>();
                              snapshot.data["bases"].forEach((cadaBase) {
                                base.add(cadaBase["base"]);
                              });

                              List<String> descricao = new List<String>();
                              snapshot.data["bases"].forEach((cadaDesc){
                                descricao.add(cadaDesc["descricao"]);
                              });

                              return ListTile(
                                leading: const Icon(
                                  Icons.location_city,
                                  size: 35,
                                ),
                                title: Text(base[index]),
                                subtitle: Text(descricao[index]),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PedidoGraph()));
                                },
                                trailing: Icon(
                                  Icons.traffic,
                                  size: 45,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(30, 0, 60, 0),
                              );
                            });
                        } else{

                        }
                      }
                  }
                })
            )
      ],
    );
  }
}
