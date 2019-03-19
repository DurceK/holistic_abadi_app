import 'package:flutter/material.dart'; //IMPORT DOS PACOTES
import 'package:holistic_abadi_app/ui/menu_page.dart';

class Home extends StatefulWidget {
  //Definição da classe Home().

  @override
  _HomeState createState() =>
      _HomeState(); //Definição do Retorno da classe Home().
}

class _HomeState extends State<Home> {
  // definição da classe HomeState(), onde serão feitas as funções da classe Home().
  final _formKey = GlobalKey<
      FormState>(); //definição da FormKey, que é a chave do formulário responsavel por identificar e indexar o estado do formulário.
  @override //sobre escrita do método Build
  Widget build(BuildContext context) {
    //Widget Build responsavel por construir os elementos desta tela.
    return Scaffold(
        // esse método construtor ira retornar um widget chamado Scaffold() que incorpora quase todos os compontentes de tela presente em um aplicativo mobile.
        backgroundColor: Colors.yellowAccent,//Aqui é definida a cor de fundo do widget Scaffold().
        appBar: AppBar(//A AppBar é aquela Barrinha superior presente nos aplicativos aqui ela é parte do nosso widget Scaffold().
          centerTitle: true,//este parametro centerTitle realiza a centralização do titulo da app bar.
          title: Text("ABADI HOLISTIC APP", //a definição do titulo da app bar.
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),//estilo do texto do titulo da app bar.
          backgroundColor: Colors.blue,//cor de fundo da AppBar.
        ),
        body: Form(//Definição do corpo do nosso Widget Scaffold, que se inicia com um formulário.
            key: _formKey,//indicação da chave do formulário.
            child: SingleChildScrollView(/* o nosso formulário tem um Filho que é um SingleChildScrollView() widget que tem
            a propriedade de tonar nossa tela em um elemento rolável */
              padding: EdgeInsets.all(16.0),//com o atributo padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(10, 30, 10, 10)),
                  Image.asset("imagens/logo_ipiranga.png"),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "Login"),
                        keyboardType: TextInputType.text,
                        validator: (text) {
                          if (text.isEmpty || text != "ksd") {
                            return "Loguin Inválido!";
                          }
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 90),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "Senha"),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (text) {
                          if (text.isEmpty || text != "kaiques")
                            return "Senha Inválida!";
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
                        if (_formKey.currentState.validate()) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MenuPage()));
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
            )));
  }
}
