import 'package:flutter/material.dart';
class MenuTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors:[ Colors.blue,
            Colors.white
            ],
          begin: Alignment.topLeft,
            end: Alignment.bottomRight
        )
      ),

    );

    return Stack(
      children: <Widget>[
        _buildBodyBack(),

        CustomScrollView(

          slivers: <Widget>[

            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor:  Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Início"),
                centerTitle: true,
              ),
            ),

            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 0.9,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {

                  return FlatButton.icon(onPressed: (){}, icon: Icon(Icons.attach_money), label: Text("Faturamento"));
                },
                childCount:4,
              ),
            )
            
          ],
        ),

      ],
    );
  }
}
