import 'package:flutter/material.dart';
class DrawerTile extends StatelessWidget {
   final IconData icon;
   final String text;
   final PageController controller;
   final int page;

   DrawerTile(this.text, this.controller, this.page, [this.icon]);
  @override
  Widget build(BuildContext context) {
    return Material(

      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
             Icon(
              icon,
            size: 32,
               color: controller.page.round()==page? //aqui a cor do botão muda caso esteja na própria tela e o round arredonda o valor double para o parame
               Theme.of(context).primaryColor: Colors.grey[700],
             )  ,
              SizedBox(width: 32.0,),
              Text(text,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
