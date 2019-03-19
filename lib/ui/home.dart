import 'package:flutter/material.dart';// MAIN
import 'package:holistic_abadi_app/ui/menu_page.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellowAccent,
        appBar: AppBar(
          centerTitle: true,
          title: Text("ABADI HOLISTIC APP",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.blue,
        ),
        body: Form(
          key: _formKey,
            child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(10, 30,10,10)),
              Image.asset("imagens/logo_ipiranga.png"),

              Padding(
                padding:EdgeInsets.fromLTRB(10,30,10,10) ,
                child:
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Login"
                ),
                keyboardType: TextInputType.text,
                validator: (text){
                  if (text.isEmpty || text!="ksd"){ return "Loguin Inválido!";
                }},
              )),
              Padding(
                padding:EdgeInsets.fromLTRB(10,10,10,90) ,
                child:
              TextFormField(
                decoration: InputDecoration(
                    hintText:"Senha"
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (text){
                  if (text.isEmpty || text!="kaiques") return "Senha Inválida!";
                },

              )),
              /*Align(alignment: Alignment.centerRight,
                child:  FlatButton(
                    onPressed: () {},
                    padding:EdgeInsets.fromLTRB(10,0,10,70),
                      child: Text("Esqueci a senha!",style: TextStyle(color: Colors.blueAccent),)),
              ),*/
              SizedBox(
                height: 44.0,
                child: RaisedButton(

                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => MenuPage()));
                    }
                  },
                  child: Text(
                    "ENTRAR",
                    style: TextStyle(fontSize: 15.0),

                  ),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,

                ),
              ),

            ],
          ),
        ))
    );}
}
