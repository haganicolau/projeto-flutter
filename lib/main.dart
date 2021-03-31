import 'package:flutter/material.dart';
import 'package:flutter_alfabank/database/app_database.dart';
import 'package:flutter_alfabank/modules/transferencia.dart';
import 'package:flutter_alfabank/screen/formulario_transferencia.dart';
import 'package:flutter_alfabank/screen/home.dart';
import 'package:flutter_alfabank/screen/lista_transferencia.dart';

void main() {
  runApp(App());
  // save(Transferencia(nome:"Bruno", valor: 126.00, conta: "58896")).then((id) {
  //   findAll().then((transferencias) => debugPrint(transferencias.toString()));
  // });
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple[500],
        accentColor: Colors.deepPurple[400],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple[700],
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: Home(),
    );
  }

}






