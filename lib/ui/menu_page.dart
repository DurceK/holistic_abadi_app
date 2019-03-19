import 'package:flutter/material.dart';
import 'package:holistic_abadi_app/ui/menu_tab.dart';
import 'package:holistic_abadi_app/ui/pedido_page.dart';
import 'package:holistic_abadi_app/ui/pedido_pagetest.dart';
import 'package:holistic_abadi_app/widgets/custom_drawer.dart';//HOME SCREEN
class  MenuPage extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: MenuTab(),

          drawer: CustomDrawer(_pageController),

        ),

        Scaffold(
          appBar: AppBar(
            title: Text("Faturamento"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          //body: PedidoPage(),
        ),

        Scaffold(
          appBar: AppBar(
            title: Text("Pedidos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: PedidoPageTest(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Frete"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
         // body: PedidoPage(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Estoque"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          //body: PedidoPage(),
        ),


      ],

    );
  }
}
