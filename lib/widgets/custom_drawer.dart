import 'dart:io';

import 'package:flutter/material.dart';
import 'package:holistic_abadi_app/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[ Colors.grey,
              Colors.white
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
          )
      ),

    );


    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0.0,
                      left: 0.0,
                      child: Text("Abadi\n   Holistic\n       App",
                      style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom:-1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Olá, Kaique Durce!",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight:  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider( ),
              DrawerTile(Icons.home,"Início",pageController,0),
              DrawerTile(Icons.attach_money,"Faturamento",pageController,1),
              DrawerTile(Icons.assignment,"Pedidos",pageController,2),
              DrawerTile(Icons.local_shipping,"Frete",pageController,3),
              DrawerTile(Icons.local_gas_station,"Estoque",pageController,4),
              Divider(),
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.fromLTRB(0,10,40,10),
                child: FlatButton.icon(onPressed: (){
                      exit(0);
                }, icon:Icon(Icons.exit_to_app) , label: Text("Sair",style: TextStyle(fontSize: 18),)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

