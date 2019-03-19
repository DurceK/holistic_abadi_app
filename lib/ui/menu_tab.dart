
import 'package:flutter/material.dart';

class MenuTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        );

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Início"),
                centerTitle: true,
              ),
            ),
            /*SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                ),
                delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[4 * (index % 9)],
                    child: Text('Célula $index'),
                  );
                },
                  childCount: 4,
                ),
            )*/
          ],
        ),
      ],
    );
  }
}
