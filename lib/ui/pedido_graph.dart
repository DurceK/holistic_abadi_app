import 'package:flutter/material.dart';
import '../bar_chart/bar_gallery.dart' as bar show buildGallery;
import '../pie_chart/pie_gallery.dart' as pie show buildGallery;
import 'package:charts_flutter/flutter.dart' as charts;
import '../pie_chart/simple.dart';

class StatusSemanalPedido {
  final String dias;
  final int pedidos;
  final charts.Color color;

  StatusSemanalPedido(this.dias, this.pedidos, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class PedidoGraph extends StatelessWidget {
  final barGalleries = bar.buildGallery();
  final pieGalleries = pie.buildGallery();

  @override
  Widget build(BuildContext context) {
    var data = [
      new StatusSemanalPedido("SEGUNDA", 22, Colors.green),
      new StatusSemanalPedido("TERÇA", 22, Colors.deepOrange),
      new StatusSemanalPedido("QUARTA", 22, Colors.amber),
      new StatusSemanalPedido("QUINTA", 22, Colors.blue),
      new StatusSemanalPedido("SEXTA", 22, Colors.red),
    ];
    var series = [
      new charts.Series(
        domainFn: (StatusSemanalPedido statusSemanalPedidoData, _) =>
            statusSemanalPedidoData.dias,
        measureFn: (StatusSemanalPedido statusSemanalPedidoData, _) =>
            statusSemanalPedidoData.pedidos,
        colorFn: (StatusSemanalPedido statusSemanalPedidoData, _) =>
            statusSemanalPedidoData.color,
        id: 'Pedidos',
        data: data,
      ),
    ];
    var chart = new charts.BarChart(
      series,
      animate: true,
    );
    var chartWidget = new Padding(
      padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: new SizedBox(
        height: 200.0,
        child: chart,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Gráficos de Pedidos",),

        centerTitle: true,
        backgroundColor: Colors.blueAccent,

      ),
      body: Center(
        child: Column(
          children: <Widget>[
           Padding(
            padding: EdgeInsets.all(20),
          ),
           Text("Status Diário do Pedido"),
            SizedBox(
              height: 200.0,
              width: 200.0,
              child: SimplePieChart.withSampleData(),
            ),
            Text("Status Semanal dos Pedidos"),
            chartWidget,
        ]
        ),
      ),
    );
  }
}
