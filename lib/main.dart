import 'package:flutter/material.dart';
import 'package:holistic_abadi_app/ui/home.dart';
import 'package:holistic_abadi_app/ui/menu_page.dart';
import 'package:holistic_abadi_app/ui/menu_tab.dart';

void main() {
  runApp(MaterialApp(
      home: MenuPage(),
    theme: ThemeData(hintColor: Colors.blueAccent,
    ),
    debugShowCheckedModeBanner: false,
  ));
}


