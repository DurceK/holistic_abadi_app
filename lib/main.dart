import 'package:flutter/material.dart';
import 'package:holistic_abadi_app/ui/home.dart';


void main() {
  runApp(MaterialApp(
      home: Home(),
    theme: ThemeData(hintColor: Colors.blueAccent,
    ),
    debugShowCheckedModeBanner: false,
  ));
}


