import 'package:flutter/material.dart'; // Import das bibliotecas utilizadas nesta página do progeto.

class GridPage extends StatefulWidget {// Criação da classe GridPage() que pode ser chamada por outras paginas e receber valores para mudar seu estado.
  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {// Criação da classe "Interna/Privada" que extende a classe acima GridPage(), aqui que acontece a mágica.
  @override
  Widget build(BuildContext context) { // Comparado ao método contrutor em outras linguagens, esse cara me permite criar elementos de tela.
    return Scaffold(  // Aqui retorno para exibição um Scaffold elemento que herda quase todos os componentes necessários para um app completo.
        appBar: AppBar(// Declaração da AppBar, elemento que forma a barra superior da tela.
          backgroundColor: Colors.blueAccent, //
        ),
        body: GridView.count(// No corpo da tela, criei uma GridView.count, esse elemento vai me permitir criar um grid com um tamanho determinado e com widgets diferentes.
            crossAxisCount: 2,// Aqui é indicado a quantidade de colunas que os elementos serão divididos.
            children: List.generate(100, (index) {//dentro do meu GridView(), foi criada uma Lista que tem 100 itens e todos terão index.
              return Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            })));
  }
}
