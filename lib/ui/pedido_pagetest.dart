import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//Importando os pacotes necessários para a criação desta instância.


const request =
    "http://172.20.49.50:8972/pedidos/pedidosbase"; //Definindo as constantes utilizadas nessa Dart File.

class PedidoPageTest extends StatefulWidget {
  //Definindo a classe PedidoPageTest() que é o caminho utilizado para acessar a _PedidoPageState().
  @override
  _PedidoPageState createState() =>
      _PedidoPageState(); //Basicamente a classe PedidoPageTeste() quando for acionada irá retornar o que estiver na classe _PedidoPageState().
}

class _PedidoPageState extends State<PedidoPageTest> {
  //Definição da classe _PedidoPageState()
  Future<List> getBases() async {
    var data = await http.get("http://172.20.49.50:8972/pedidos/pedidosbase");
    var jsonData = json.decode(data.body);

    List<Base> bases = [];
    for (var b in jsonData) {
      Base base = Base(
          b["bases"]["0"]["base"],
          b["bases"]["0"]["descricao"],
          b["bases"]["0"]["status"],
          b["bases"]["0"]["totPedDia"],
          b["bases"]["0"]["totPedDiaFaturados"],
          b["bases"]["0"]["totPedDiaCarregados"],
          b["bases"]["0"]["totPedDiaMenosUm"],
          b["bases"]["0"]["totPedDiaMenosDois"],
          b["bases"]["0"]["totPedDiaMenosTres"],
          b["bases"]["0"]["totPedDiaMenosQuatro"]);
      bases.add(base);
    }
    print(bases.length);

    return bases;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getBases(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].base),
                  );
                });
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].base),
                  );
                });
          }
        },
      ),
    );
  }
}

class Base {
  final base; //número da base ou CDEP = código da dependência.
  final descricao; //descrição simples da base, ou nome da base.
  final status; //Status que indica se a filial esta com problemas em relação aos pedidos.
  final totPedDia; //total de pedidos feitos no dia.
  final totPedDiaFaturados; //total de pedidos faturados naquele dia.
  final totPedDiaCarregados; //total de pedidos Carregados naquele dia.
  final totPedDiaMenosUm; //total de pedidos feitos no dia anterior.
  final totPedDiaMenosDois; //total de pedidos feitos dois dias antes.
  final totPedDiaMenosTres; //total de pedidos feitos tres dias antes.
  final totPedDiaMenosquatro; //total de pedidos feitos quatro' dias antes.

  Base(
      //Método Set da classe Bases().
      this.base,
      this.descricao,
      this.status,
      this.totPedDia,
      this.totPedDiaFaturados,
      this.totPedDiaCarregados,
      this.totPedDiaMenosUm,
      this.totPedDiaMenosDois,
      this.totPedDiaMenosTres,
      this.totPedDiaMenosquatro);
}
