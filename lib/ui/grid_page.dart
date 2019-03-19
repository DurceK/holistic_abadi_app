import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        ),
        body: GridView.count(crossAxisCount: 2,
        children:List.generate(100,(index){
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline,
            ),
          );
        })
        )

    );
  }
}
